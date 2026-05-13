/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class PrinterServiceDTOs {
    global PrinterServiceDTOs() {

    }
global class Capabilities {
    global List<String> bins {
        get;
        set;
    }
    global Capabilities() {

    }
}
global class ComputerInfo {
    global String id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global String state {
        get;
        set;
    }
    global ComputerInfo() {

    }
}
global class Measurement {
    global Long g;
    global Long kg;
    global Long lb;
    global Long oz;
    global Measurement() {

    }
}
global virtual class PrintJob {
    global String content {
        get;
        set;
    }
    global String contentType {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global zkmulti.PrinterServiceDTOs.PrintJobOption options {
        get;
        set;
    }
    global String printerId {
        get;
        set;
    }
    global String source {
        get;
        set;
    }
    global String state {
        get;
        set;
    }
    global String title {
        get;
        set;
    }
    global PrintJob() {

    }
}
global virtual class PrintJobOption {
    global String bin {
        get;
        set;
    }
    global PrintJobOption() {

    }
}
global virtual class PrintNodeAccount {
    global String email {
        get;
        set;
    }
    global String firstname {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global String lastname {
        get;
        set;
    }
    global String password {
        get;
        set;
    }
    global PrintNodeAccount() {

    }
}
global class PrintNodeAccountStatus extends zkmulti.PrinterServiceDTOs.PrintNodeAccount {
    global String state {
        get;
        set;
    }
    global PrintNodeAccountStatus() {

    }
}
global class Printer {
    global zkmulti.PrinterServiceDTOs.Capabilities capabilities {
        get;
        set;
    }
    global zkmulti.PrinterServiceDTOs.ComputerInfo computer {
        get;
        set;
    }
    global String id {
        get;
        set;
    }
    global String name {
        get;
        set;
    }
    global String state {
        get;
        set;
    }
    global Printer() {

    }
}
global class ScalesData {
    global String computerId {
        get;
        set;
    }
    global String deviceName {
        get;
        set;
    }
    global String deviceNum {
        get;
        set;
    }
    global List<Long> mass {
        get;
        set;
    }
    global zkmulti.PrinterServiceDTOs.Measurement measurement {
        get;
        set;
    }
    global ScalesData() {

    }
}
}
