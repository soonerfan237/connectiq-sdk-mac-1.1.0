//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Application as App;

class RecordSampleApp extends App.AppBase {

    var recordSampleView;

    //! onStart() is called on application start up
    function onStart() {
    }

    //! onStop() is called when your application is exiting
    function onStop() {
        recordSampleView.stopRecording();
    }

    //! Return the initial view of your application here
    function getInitialView() {
        recordSampleView = new RecordSampleView();
        return [ recordSampleView, new BaseInputDelegate() ];
    }

}