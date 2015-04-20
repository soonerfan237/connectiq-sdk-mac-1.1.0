//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;

class DetailsDelegate extends Ui.InputDelegate
{

    function onPreviousPage(transition)
    {
        Ui.popView(transition);
    }

    function onSwipe(evt) {
        if (evt.getDirection() == Ui.SWIPE_RIGHT) {
            onPreviousPage(Ui.SLIDE_RIGHT);
        } else if (evt.getDirection() == Ui.SWIPE_DOWN) {
            onPreviousPage(Ui.SLIDE_DOWN);
        }
    }

}