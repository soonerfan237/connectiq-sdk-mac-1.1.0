//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Application as App;

class WeatherApp extends App.AppBase {
    hidden var mModel;
    hidden var mView;

    //! onStart() is called on application start up
    function onStart() {
        mView = new WeatherView();
        mModel = new WeatherModel(mView.method(:onWeather));
    }

    //! onStop() is called when your application is exiting
    function onStop() {
    }

    //! Return the initial view of your application here
    function getInitialView() {
        return [ mView ];
    }

}