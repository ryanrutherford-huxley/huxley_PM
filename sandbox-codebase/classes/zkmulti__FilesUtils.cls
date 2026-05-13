/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class FilesUtils {
    global FilesUtils() {

    }
    global static void deleteFiles(List<zkmulti.FilesUtils.FileWrapper> files) {

    }
    global static Id insertFile(zkmulti.FilesUtils.FileWrapper file) {
        return null;
    }
    global static List<Id> insertFiles(List<zkmulti.FilesUtils.FileWrapper> files) {
        return null;
    }
global class FileWrapper {
    global Blob contents {
        get;
        set;
    }
    global String contentType {
        get;
        set;
    }
    global Id contentVersionId {
        get;
        set;
    }
    global Datetime createdDate {
        get;
        set;
    }
    global String downloadUrl {
        get;
        set;
    }
    global String extContentType {
        get;
        set;
    }
    global String fileName {
        get;
        set;
    }
    global Integer index {
        get;
        set;
    }
    global Id objectId {
        get;
        set;
    }
    global zkmulti.FilesUtils.FileObjectType objectType {
        get;
        set;
    }
    global Id parentId {
        get;
        set;
    }
    global FileWrapper() {

    }
}
}
