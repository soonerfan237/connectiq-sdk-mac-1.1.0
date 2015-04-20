//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class SecondInputDelegate extends Ui.BehaviorDelegate
{
    function onPreviousPage()
    {
        Ui.popView(Ui.SLIDE_RIGHT);
    }
}

class SecondView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        dc.drawText(10, 20, Gfx.FONT_MEDIUM, "2nd page", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 50, Gfx.FONT_SMALL, "Things to do while here", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 70, Gfx.FONT_SMALL, " 1) Swipe to the previous page", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 90, Gfx.FONT_SMALL, "    (behavior)", Gfx.TEXT_JUSTIFY_LEFT);
    }
}

