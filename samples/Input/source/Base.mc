//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class BaseInputDelegate extends Ui.BehaviorDelegate
{
    function onSwipe(evt)
    {
        if(evt.getDirection() == Ui.SWIPE_DOWN)
        {
            Ui.pushView(new SecondView(), new SecondInputDelegate(), Ui.SLIDE_IMMEDIATE );
        }
    }

    function onMenu()
    {
        Ui.pushView( new MenuView(), new MenuInputDelegate(), Ui.SLIDE_IMMEDIATE );
    }
}

class BaseView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );

        dc.drawText(10, 20, Gfx.FONT_MEDIUM, "Base page", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 50, Gfx.FONT_SMALL, "Things to do while here", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 70, Gfx.FONT_SMALL, " 1) Click the menu (behavior)", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 90, Gfx.FONT_SMALL, " 2) Swipe down to the next page", Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(10, 110, Gfx.FONT_SMALL, "    (input)", Gfx.TEXT_JUSTIFY_LEFT);
    }
}

