//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Application as App;

class InputExample extends App.AppBase
{
    function getInitialView() {
        return [ new BaseView(), new BaseInputDelegate() ];
    }
}
