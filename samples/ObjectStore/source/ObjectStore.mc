//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;

enum
{
    INT_KEY,
    FLOAT_KEY,
    STRING_KEY
}

class Input extends Ui.InputDelegate
{
    var count = 0;

    function onTap(evt)
    {
        var app = App.getApp();

        if(0 == count)
        {
            app.setProperty(INT_KEY, 3);
        }
        else if(1 == count)
        {
            app.setProperty(FLOAT_KEY, 3.14159);
        }
        else if(2 == count)
        {
            app.setProperty(STRING_KEY, "pie");
        }
        else
        {
            app.deleteProperty(count - 3);
        }

        count += 1;

        if(count == 6)
        {
            count = 0;
        }

        Ui.requestUpdate();
    }

    function onHold(evt)
    {
        App.getApp().clearProperties();
        Ui.requestUpdate();
    }
}

class View extends Ui.View
{
    function onUpdate(dc)
    {
        var app = App.getApp();

        var int = app.getProperty(INT_KEY);
        var float = app.getProperty(FLOAT_KEY);
        var string = app.getProperty(STRING_KEY);

        if(null==int)
        {
            int="Not set";
        }

        if(null==float)
        {
            float="Not set";
        }

        if(null==string)
        {
            string="Not set";
        }

        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        dc.clear();
        dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
        dc.drawText(0, 20, Gfx.FONT_MEDIUM, "Int: " + int, Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(0, 50, Gfx.FONT_MEDIUM, "Float: " + float, Gfx.TEXT_JUSTIFY_LEFT);
        dc.drawText(0, 80, Gfx.FONT_MEDIUM, "String: " + string, Gfx.TEXT_JUSTIFY_LEFT);
    }
}

class ObjectStore extends App.AppBase
{
    function getInitialView()
    {
        return [new View(), new Input()];
    }
}
