#!/usr/bin/env python3

import argparse
import csv
import json
from collections import Counter
from pathlib import Path
from typing import Optional


def load_sbom(path: Path) -> dict:
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)


def infer_ecosystem(pkg: dict) -> str:
    for ref in pkg.get("externalRefs", []):
        locator = ref.get("referenceLocator", "")
        if locator.startswith("pkg:npm/"):
            return "npm"
        if locator.startswith("pkg:pypi/"):
            return "pypi"
        if locator.startswith("pkg:maven/"):
            return "maven"
    return "unknown"


def package_purl(pkg: dict) -> str:
    for ref in pkg.get("externalRefs", []):
        if ref.get("referenceType") == "purl":
            return ref.get("referenceLocator", "")
    return ""


def normalize_package(pkg: dict) -> dict:
    return {
        "name": pkg.get("name") or "",
        "version": pkg.get("versionInfo") or "",
        "license": pkg.get("licenseConcluded") or pkg.get("licenseDeclared") or "",
        "ecosystem": infer_ecosystem(pkg),
        "purl": package_purl(pkg),
        "spdx_id": pkg.get("SPDXID") or "",
        "download_location": pkg.get("downloadLocation") or "",
    }


def summarize_document(data: dict, source_path: Path) -> tuple[dict, list[dict]]:
    packages = [normalize_package(pkg) for pkg in data.get("packages", [])]
    ecosystem_counts = Counter(pkg["ecosystem"] for pkg in packages)
    license_counts = Counter(pkg["license"] or "UNKNOWN" for pkg in packages)
    relationships = data.get("relationships", [])
    described_package_id = next(
        (
            rel.get("relatedSpdxElement")
            for rel in relationships
            if rel.get("relationshipType") == "DESCRIBES"
            and rel.get("spdxElementId") == "SPDXRef-DOCUMENT"
        ),
        "",
    )
    dependency_relationships = [
        rel for rel in relationships if rel.get("relationshipType") == "DEPENDS_ON"
    ]
    direct_dependency_count = sum(
        1
        for rel in dependency_relationships
        if rel.get("spdxElementId") == described_package_id
    )
    unique_dependency_ids = {
        rel.get("relatedSpdxElement")
        for rel in dependency_relationships
        if rel.get("relatedSpdxElement")
    }

    summary = {
        "source_file": str(source_path),
        "document_name": data.get("name", ""),
        "spdx_version": data.get("spdxVersion", ""),
        "created": data.get("creationInfo", {}).get("created", ""),
        "creators": ", ".join(data.get("creationInfo", {}).get("creators", [])),
        "package_count": len(packages),
        "relationship_count": len(relationships),
        "dependency_relationship_count": len(dependency_relationships),
        "direct_dependency_count": direct_dependency_count,
        "unique_dependency_count": len(unique_dependency_ids),
        "ecosystem_counts": ecosystem_counts,
        "license_counts": license_counts,
    }
    return summary, packages


def render_text(summary: dict, packages: list[dict], limit: int) -> str:
    lines = [
        f"Source file: {summary['source_file']}",
        f"Document: {summary['document_name']}",
        f"SPDX version: {summary['spdx_version']}",
        f"Created: {summary['created']}",
        f"Creators: {summary['creators'] or 'N/A'}",
        f"Package records: {summary['package_count']}",
        f"Direct dependencies: {summary['direct_dependency_count']}",
        f"Unique dependencies in graph: {summary['unique_dependency_count']}",
        f"Dependency relationships: {summary['dependency_relationship_count']}",
        f"Relationships: {summary['relationship_count']}",
        "",
        "Packages by ecosystem:",
    ]

    for ecosystem, count in summary["ecosystem_counts"].most_common():
        lines.append(f"  - {ecosystem}: {count}")

    lines.extend(["", "Top licenses:"])
    for license_name, count in summary["license_counts"].most_common(10):
        lines.append(f"  - {license_name}: {count}")

    lines.extend(["", f"First {min(limit, len(packages))} packages:"])
    for pkg in packages[:limit]:
        version = pkg["version"] or "unknown"
        license_name = pkg["license"] or "UNKNOWN"
        lines.append(
            f"  - {pkg['name']} {version} | {pkg['ecosystem']} | {license_name}"
        )

    return "\n".join(lines)


def render_markdown(summary: dict, packages: list[dict], limit: int) -> str:
    lines = [
        f"# {summary['document_name'] or 'SBOM Summary'}",
        "",
        f"- Source file: `{summary['source_file']}`",
        f"- SPDX version: `{summary['spdx_version']}`",
        f"- Created: `{summary['created']}`",
        f"- Creators: `{summary['creators'] or 'N/A'}`",
        f"- Package records: `{summary['package_count']}`",
        f"- Direct dependencies: `{summary['direct_dependency_count']}`",
        f"- Unique dependencies in graph: `{summary['unique_dependency_count']}`",
        f"- Dependency relationships: `{summary['dependency_relationship_count']}`",
        f"- Relationships: `{summary['relationship_count']}`",
        "",
        "## Package Counts by Ecosystem",
        "",
        "| Ecosystem | Count |",
        "| --- | ---: |",
    ]

    for ecosystem, count in summary["ecosystem_counts"].most_common():
        lines.append(f"| {ecosystem} | {count} |")

    lines.extend(
        [
            "",
            "## Top Licenses",
            "",
            "| License | Count |",
            "| --- | ---: |",
        ]
    )
    for license_name, count in summary["license_counts"].most_common(10):
        lines.append(f"| {license_name} | {count} |")

    lines.extend(
        [
            "",
            f"## First {min(limit, len(packages))} Packages",
            "",
            "| Name | Version | Ecosystem | License | PURL |",
            "| --- | --- | --- | --- | --- |",
        ]
    )
    for pkg in packages[:limit]:
        lines.append(
            f"| {pkg['name']} | {pkg['version'] or 'unknown'} | {pkg['ecosystem']} | "
            f"{pkg['license'] or 'UNKNOWN'} | {pkg['purl']} |"
        )

    return "\n".join(lines)


def write_csv(path: Path, packages: list[dict]) -> None:
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=[
                "name",
                "version",
                "license",
                "ecosystem",
                "purl",
                "spdx_id",
                "download_location",
            ],
        )
        writer.writeheader()
        writer.writerows(packages)


def build_output_path(source: Path, suffix: str, output_dir: Optional[Path]) -> Path:
    target_dir = output_dir if output_dir is not None else source.parent
    return target_dir / f"{source.stem}-readable{suffix}"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Convert SPDX SBOM JSON into a more readable summary."
    )
    parser.add_argument("files", nargs="+", help="Path(s) to SPDX JSON files")
    parser.add_argument(
        "--format",
        choices=["text", "markdown"],
        default="text",
        help="Readable output format",
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=25,
        help="How many packages to include in the readable preview",
    )
    parser.add_argument(
        "--write",
        action="store_true",
        help="Write the readable output next to each source file",
    )
    parser.add_argument(
        "--csv",
        action="store_true",
        help="Also write a CSV with one row per package next to each source file",
    )
    parser.add_argument(
        "--output-dir",
        help="Directory to write generated files into when using --write or --csv",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    output_dir = None
    if args.output_dir:
        output_dir = Path(args.output_dir).expanduser().resolve()
        output_dir.mkdir(parents=True, exist_ok=True)

    for file_arg in args.files:
        source = Path(file_arg).expanduser().resolve()
        data = load_sbom(source)
        summary, packages = summarize_document(data, source)

        if args.format == "markdown":
            rendered = render_markdown(summary, packages, args.limit)
            suffix = ".md"
        else:
            rendered = render_text(summary, packages, args.limit)
            suffix = ".txt"

        if args.write:
            output_path = build_output_path(source, suffix, output_dir)
            output_path.write_text(rendered + "\n", encoding="utf-8")
            print(f"Wrote readable summary: {output_path}")
        else:
            print(rendered)
            print()

        if args.csv:
            csv_path = build_output_path(source, ".csv", output_dir)
            write_csv(csv_path, packages)
            print(f"Wrote package CSV: {csv_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
