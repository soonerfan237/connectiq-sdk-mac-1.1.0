//!
//! Copyright 2015 by Garmin Ltd. or its subsidiaries.
//! Subject to Garmin SDK License Agreement and Wearables
//! Application Developer Agreement.
//!

using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;
using Toybox.Graphics;
using Toybox.System as Sys;
using Toybox.Position;

class Weather
{
    var temperature;
    var city;
}

class WeatherModel
{
    hidden var notify;

    function kelvinToFarenheight(kelvin)
    {
        return ( (9 * (kelvin - 273) ) / 5.0 ) + 32;
    }

    function onPosition(info)
    {
        var latLon = info.position.toDegrees();

        Sys.println(latLon[0].toString());
        Sys.println(latLon[1].toString());

        Comm.makeJsonRequest("http://api.openweathermap.org/data/2.5/weather",
             {"lat"=>latLon[0].toFloat(), "lon"=>latLon[1].toFloat()}, {}, method(:onReceive));

        notify.invoke("Loading\nWeather");
    }

    function initialize(handler)
    {
        Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, method(:onPosition));
        notify = handler;
    }

    function onReceive(responseCode, data)
    {
        if( responseCode == 200 )
        {
            var weather = new Weather();
            weather.city = data["name"];
            weather.temperature = kelvinToFarenheight(data["main"]["temp"]);
            Sys.println(weather.city);
            Sys.println(weather.temperature);
            notify.invoke(weather);
        }
        else
        {
            notify.invoke( "Failed to load\nError: " + responseCode.toString() );
        }
    }

}

class WeatherView extends Ui.View {
    hidden var mWeather = "";
    hidden var mModel;
    //! Load your resources here
    function onLayout(dc) {
        mWeather = "Waiting for GPS";
    }

    //! Restore the state of the app and prepare the view to be shown
    function onShow() {
    }

    //! Update the view
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
        dc.clear();
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_MEDIUM, mWeather, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    //! Called when this View is removed from the screen. Save the
    //! state of your app here.
    function onHide() {
    }

    function onWeather(weather)
    {
        if (weather instanceof Weather)
        {
            mWeather = Lang.format("City: $1$\nTemp: $2$", [weather.city, weather.temperature]);
        }
        else if (weather instanceof Lang.String)
        {
            mWeather = weather;
        }
        Ui.requestUpdate();
    }

}