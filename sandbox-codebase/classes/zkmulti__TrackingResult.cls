/*
This file is generated and isn't the actual source code for this
managed global class.
This read-only file shows the class's global constructors,
methods, variables, and properties.
To enable code to compile, all methods return null.
*/
global class TrackingResult {
    global Boolean isSuccess;
    global List<zkmulti.Message> messages;
    global Id shipmentId;
    global String trackerId;
    global zkmulti.TrackingResult.TrackShipmentInfo trackInfo;
    global List<zkmulti.TrackingResult.TrackingHistory> trackingHistories;
    global TrackingResult() {

    }
global class TrackShipmentInfo {
    global List<String> avalibleInfo;
    global Map<String,Object> shipmentInfoMap;
    global TrackShipmentInfo() {

    }
}
global class TrackingHistory {
    global Datetime datetime_x;
    global String location;
    global String message;
    global String source;
    global String status;
    global TrackingHistory() {

    }
    global Datetime getDateTime() {
        return null;
    }
    global String getDateTimeStr() {
        return null;
    }
}
}
