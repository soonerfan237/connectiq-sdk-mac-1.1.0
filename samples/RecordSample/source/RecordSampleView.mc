//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.ActivityRecording as Record;
using Toybox.Position as Position;

var session = null;

class BaseInputDelegate extends Ui.BehaviorDelegate
{
    function onMenu() {
        if( Toybox has :ActivityRecording ) {
            if( ( session == null ) || ( session.isRecording() == false ) ) {
                session = Record.createSession({:name=>"Walk", :sport=>Record.SPORT_WALKING});
                session.start();
                Ui.requestUpdate();
            }
            else if( ( session != null ) && session.isRecording() ) {
                session.stop();
                session.save();
                Ui.requestUpdate();
            }
        }
    }
}

class RecordSampleView extends Ui.View {

    //! Stop the recording if necessary
    function stopRecording() {
        if( Toybox has :ActivityRecording ) {
            if( session != null && session.isRecording() ) {
                session.stop();
                session.save();
                Ui.requestUpdate();
            }
        }
    }

    //! Load your resources here
    function onLayout(dc) {
    }


    function onHide() {
        Position.enableLocationEvents(Position.LOCATION_DISABLE, method(:onPosition));
    }

    //! Restore the state of the app and prepare the view to be shown.
    //! We need to enable the location events for now so that we make sure GPS
    //! is on.
    function onShow() {
        Position.enableLocationEvents(Position.LOCATION_CONTINUOUS, method(:onPosition));
    }

    //! Update the view
    function onUpdate(dc) {
        // Set background color
        dc.clear();
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        if( Toybox has :ActivityRecording ) {
            // Draw the instructions
            if( ( session == null ) || ( session.isRecording() == false ) ) {
                dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_WHITE);
                dc.drawText(20, 20, Gfx.FONT_MEDIUM, "Press Menu to", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(25, 40, Gfx.FONT_MEDIUM, "Start Recording", Gfx.TEXT_JUSTIFY_LEFT);
            }
            else if( ( session != null ) && session.isRecording() ) {
                dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_WHITE);
                dc.drawText(20, 20, Gfx.FONT_MEDIUM, "Recording...", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(20, 60, Gfx.FONT_MEDIUM, "Press Menu again", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(25, 90, Gfx.FONT_MEDIUM, "to Stop and Save", Gfx.TEXT_JUSTIFY_LEFT);
                dc.drawText(25, 120, Gfx.FONT_MEDIUM, "the Recording", Gfx.TEXT_JUSTIFY_LEFT);
            }
        }
        // tell the user this sample doesn't work
        else {
            dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_WHITE);
            dc.drawText(20, 20, Gfx.FONT_MEDIUM, "This product doesn't", Gfx.TEXT_JUSTIFY_LEFT);
            dc.drawText(25, 40, Gfx.FONT_MEDIUM, "have FIT Support", Gfx.TEXT_JUSTIFY_LEFT);
        }
    }

    function onPosition(info) {
    }

}