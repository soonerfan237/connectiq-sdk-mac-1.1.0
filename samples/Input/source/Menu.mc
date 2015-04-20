//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;


var instructions = [ "Things to do while here",
                     " 1) Tap the screen (input)",
                     " 2) Hold the screen (input)",
                     " 3) Swipe up (input) - Note that",
                     "    this pops this page and pushes",
                     "    a new one."];
var color = Gfx.COLOR_WHITE;
var text = instructions;

class MenuInputDelegate extends Ui.InputDelegate
{
    function onTap()
    {
        if( Gfx.COLOR_WHITE == color )
        {
            color = Gfx.COLOR_RED;
        }
        else if( Gfx.COLOR_RED == color )
        {
            color = Gfx.COLOR_GREEN;
        }
        else if( Gfx.COLOR_GREEN== color )
        {
            color = Gfx.COLOR_ORANGE;
        }
        else if( Gfx.COLOR_ORANGE == color )
        {
            color = Gfx.COLOR_WHITE;
        }
        Ui.requestUpdate();
    }

    function onHold()
    {
        text = ["You're performing a hold."];
        Ui.requestUpdate();
    }

    function onRelease()
    {
        text = instructions;
        Ui.requestUpdate();
    }

    function onSwipe(evt)
    {
        if(SWIPE_UP == evt.getDirection())
        {
            Ui.switchToView( new SecondView(), new SecondInputDelegate(), Ui.SLIDE_IMMEDIATE );
        }
    }
}

class MenuView extends Ui.View
{
    function onUpdate(dc)
    {
        dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
        dc.clear();
        dc.setColor( color, Gfx.COLOR_TRANSPARENT );

        dc.drawText(10, 20, Gfx.FONT_MEDIUM, "Menu page", Gfx.TEXT_JUSTIFY_LEFT);

        for(var i = 0; i < text.size(); i = i+1)
        {
            dc.drawText(10, 50 + (i * 15), Gfx.FONT_SMALL, text[i], Gfx.TEXT_JUSTIFY_LEFT);
        }
    }
}
