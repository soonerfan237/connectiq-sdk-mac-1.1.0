//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.UserProfile as UserProfile;

var c = 1;

class BaseInputDelegate extends Ui.BehaviorDelegate {
    function onMenu() {
        if( c == 3 ) {
            c = 1;
        }
        else {
            c = c + 1;
        }
        Ui.requestUpdate();
    }

    function onNextPage() {
    }
}

class UserProfileView extends Ui.View {


    //! Load your resources here
    function onLayout(dc) {
        onUpdate( dc );
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        var profile = UserProfile.getProfile();
        if( profile != null ) {
            var string;
            dc.setColor( Gfx.COLOR_TRANSPARENT, Gfx.COLOR_BLACK );
            dc.clear();
            dc.setColor( Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT );
            if( c == 1 ) {
                var hours;
                var minutes;
                var seconds;

                string = "Weight: " + profile.weight.toString() + " g";
                dc.drawText(25, (dc.getHeight() / 2) - 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                if( profile.gender == 0 ) {
                    string = "Gender: FEMALE";
                }
                else {
                    string = "Gender: MALE";
                }
                dc.drawText(25, (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                string = "Height: " + profile.height.toString() + " cm";
                dc.drawText(25, (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                hours = profile.wakeTime.divide( 3600 ).value();
                minutes = profile.wakeTime.value() - ( hours * 3600 );
                seconds = profile.wakeTime.value() - ( hours * 3600 ) - ( minutes * 60 );
                string = "Wake Time: " + hours.format("%02u") + ":" + minutes.format("%02u") + ":" + seconds.format("%02u");

                dc.drawText(25, (dc.getHeight() / 2) + 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
            }
            else if( c == 2 ) {
                var hours;
                var minutes;
                var seconds;

                hours = profile.sleepTime.divide( 3600 ).value();
                minutes = profile.sleepTime.value() - ( hours * 3600 );
                seconds = profile.sleepTime.value() - ( hours * 3600 ) - ( minutes * 60 );
                string = "Sleep Time: " + hours.format("%02u") + ":" + minutes.format("%02u") + ":" + seconds.format("%02u");

                dc.drawText(25, (dc.getHeight() / 2) - 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                string = "Running Step Length: " + profile.runningStepLength.toString() + " mm";
                dc.drawText(25, (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                string = "Walking Step Length: " + profile.walkingStepLength.toString() + " mm";
                dc.drawText(25, (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);

                string = "Resting Heart Rate: " + profile.restingHeartRate.toString() + " bpm";
                dc.drawText(25, (dc.getHeight() / 2) + 30, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
            }
            else {
                if( profile.activityClass <= 20 ) {
                    string = "Activity: LOW (" + profile.activityClass.toString() + ")";
                }
                else if( profile.activityClass <= 50 ) {
                    string = "Activity: MEDIUM (" + profile.activityClass.toString() + ")";
                }
                else {
                    string = "Activity: HIGH (" + profile.activityClass.toString() + ")";
                }

                dc.drawText(25, (dc.getHeight() / 2) - 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
                string = "Birth Year: " + profile.birthYear.toString();
                dc.drawText(25, (dc.getHeight() / 2) + 10, Gfx.FONT_SMALL, string, Gfx.TEXT_JUSTIFY_LEFT);
            }
        }
    }

}
