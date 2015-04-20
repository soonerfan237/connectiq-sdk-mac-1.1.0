MONKEY C
Release 1.1.0 (Aikido Monkey)

-- Intro --

Thank you for trying Monkey C!

Monkey C is a dynamically typed scripting language
designed for loading applications onto Garmin devices.

-- Getting Started --

=== OS X ===

The first step for using Monkey C is to point your PATH
to the Monkey C bin directory

    Local to a single shell instance:
    > export PATH=$PATH:<Monkey C bin dir>
or
    Add for user:
    > touch ~/.bash_profile
    > open ~/.bash_profile
    -The above opens .bash_profile in a text editor.
    -Add the below line to the file:
    > export PATH=$PATH:<Monkey C bin dir>

=== WINDOWS ===

This release works from the Windows NT shell.

The first step for using Monkey C is to point your PATH
to the Monkey C bin directory

    > set PATH=%PATH%;<Monkey C bin directory>

======

You now have access to three commands

* connectiq - The Monkey C simulator. Use this to start the simulator in
the background.

* monkeyc - The Monkey C compiler. The usage is

  > monkeyc -o <output.prg> -m <manifest.xml> [-z resource.xml;resource2.xml]
    <file1.mb> [file2.mb]...

The compiler can take code from multiple files and link them together
into a single Monkey C executable.

The optional -z argument lets you pass in resource files. If your project uses
multiple resource files separate them with the system path separator (";" in
Windows and ":" in OSX). This will let you add bitmaps, drawables, fonts,
strings, and menus to your executable. See the samples directory for a sample
resource file.

* monkeydo - Run a Monkey C executable in the simulator. You must have
previously started the simulator with connectiq. The usage is

  > mbrun <file.prg>

The typical build cycle would be

  > connectiq
  > monkeyc -o sample.prg -m manifest.xml hello_world.mb
  > monkeydo sample.prg

=== Eclipse Plug-in ===

To setup the Eclipse plug-in refer to the Programmers Guide.

-- Error Messages --

If your program terminates abruptly, you should get a stack trace
from mbrun with an error. The errors are as follows:

* Stack Underflow Error - The stack pointer went below stack memory
* Stack Overflow Error - The stack point went past stack memory
* Too Many Arguments Error - Methods are currently limited to 8 arguments.
* Unexpected Type Error - Typically using a variable type for an operation
that doesn't support it, like doing a + on an object.
* Illegal Frame Error - The VM frame was corrupted
* Out of Memory Error - There is no more system memory for allocations
* Array Out Of Bounds Error - You accessed past the end of an array
* Symbol Not Found Error - You tried to access a variable or method
that does not exist in an object.
* Null Reference Error - You passed in a null pointer
* Circular Reference Error - There is a circular reference when initializing
  a class or module
* Initializer Error - An error happened in an initializer
* System Error - An error happened in the native system
* Too Many Timers Error - You started too many Timer.Timer objects for the target device
* Watchdog Tripped Error - Code took too many VM cycles to complete
* Permission Required Error - You are attempting to use a restricted API without permission
* Unhandled Exception Error - An exception was thrown but was not caught by the app
* Communications Error - Error in BLE communications

-- Samples --

There are many sample programs in the samples directory

 1. ActivityTracking - A sample using the step count and goal from the ActivityTracking API
 2. Analog - An analog watch face designed by Austen Harbour
 3. Attention - A sample that uses the Attention API to toggle the backlight, play tones, and vibrate
 4. C64Face - A digital watch for fans of the Commodore 64! Designed by Nicolas Kral (obviously)
 5. Comm - A sample that sends and receives strings with a phone app
 6. ComplexDataField - A sample that draws a graph using sensor data
 7. ConfirmationDialog - A sample showing how Confirmation Dialogs work
 8. Drawable - A sample that shows how the Drawable system works in resources.xml
 9. GameCube - A Playstation font watch face
10. Input - A sample that uses a BehaviorDelegate to listen to behaviors and basic input events
11. Layouts - A sample that shows how the Layout system works in resources.xml
12. MathSample - A sample of math functions that shows the difference between using floats and doubles
13. MO2Display - A sample that shows how to connect to an ANT+ MO2 sensor device
14. NumberPicker - A sample that shows how the Number Picker works
15. ObjectStore - A sample that uses persistent storage
16. PositionSample - A sample that shows the current position
17. Primates - Another sample that uses input
18. ProgressBar - A sample showing how the progress bar works
19. RecordSample - A sample showing how to record Activities
20. Sensor - A sample that graphs heart rate read from a sensor
21. SimpleDataField - A sample data field that displays data read from sensors
22. Strings - A sample that shows how translations work in the resource file
23. Timer - A sample of how to use Timer.Timer to run code at a later time
24. UserProfile - A sample that shows the data available from the UserProfile module
25. Weather - A sample that uses makeJsonRequest to display the weather at your location

-- Release Notes --
v1.1.0
  * Add new project templates to SDK
  * Update fenix 3 layouts to match hardware changes
  * Update gender check in UserProfile sample app to report propertly
  * Update watch face samples to extends WatchUi.WatchFace
Known Issues:
  * Exceptions are not working correctly
v1.0.3
  * Add Shapes to WatchUi module.
  * WatchUi.TextPicker has been added. This is a native text entry View that is
    device dependent. Note: Not all devices support this View. This is currently
    supported by the 920XT and fenix 3.
  * Fixed issue with interpreting hex values that ended in 'd' or 'f'
  * Added phone connection state to the system settings
  * Made improvements to logging on devices
  * Made some localization updates
  * Updated the API documentation.
  * Various bug fixes
Known Issues:
  * Drawable list resources cannot be animated because they don't use the new Shape
    objects (and therefore don't extend Drawable). If you want to animate a shape
    you can do so by creating and drawing it in code.
v1.0.2
  * Integrated the package tool with the compiler.
  * Added support for packaging an application for different regions.
  * Added Asian font support to the simulator.
  * Updated Chinese language qualifiers from cht/chs to zht/zhs. The compiler will still
    accept cht/chs. All other languages follow the ISO 639-2 3 character code standard.
  * Pulled project types and permissions out into a XML file. The compiler will now require
    a -p option with the file path to the projectInfo.xml file inside the bin folder.
  * Remove filepaths in release builds.
  * Allow % print syntax in System print calls.
  * Simulator opens in the foreground on OSX.
  * Updated the API documentation.
  * Various bug fixes.
v1.0.1
  * Add heading information for simulator.
  * Various ANT+ improvements.
  * Various bug fixes.
v1.0.0
  * Native fonts now align at the top, like custom fonts, instead of the bottom. This will
    require adjustment of any text drawn on the screen.
  * Added Toybox.WatchUi.DataField.getObscurityFlags(). This indicates what portions of a
    data field are obscured by a round screen.
  * Added number only fonts under Toybox.Graphics.FONT_NUMBER_XXX. These are larger fonts
    that contain only numbers and certain characters.
  * initialize() is now called for AppBase objects.
  * Added Toybox.System.DeviceSettings. This provides access to the device settings such
    as distance units and time format. Also added support for this in the simulator.
  * Added support for entering and exiting low power in the simulator to provide support
    for testing the Toybox.WatchUi.WatchFace class.
  * Simulated devices now use their correct font.
  * Added simulator support for the vivoactive, fenix 3 and epix.
  * Various bug fixes.
v0.3.0
  * A breaking change has been made to the compiler. Older apps will not run with this
    release and must be recompiled.
  * Added gesture support for watch faces. This allows a watch to provide 1 second updates
    while the user is looking at it. While not in low power mode watch faces have access
    to Toybox.Timer and Toybox.WatchUi.animate().
  * Added power and position values to Activity.Info to allow datafields to access this
    information. Removed current pace from Activity.Info as it was a duplicate of speed.
  * Various bug fixes.
v0.2.4
  * Symbol Not Found error includes the symbol name.
  * Updates to the documentation.
  * Various bug fixes.
v0.2.3
  * Added power to the Fit parsing and simulation.
  * Added Toybox.Graphics.setPenWidth().
  * Added WatchUi.View.findDrawableById().
  * Added functions to WatchUi.Text and WatchUi.Bitmap to allow certain attributes
    to be modified.
  * Added support for exceptions.
        try {
            ...
        }
        catch( ex instanceof AnExceptionClass ) {
            ...
        }
        catch( ex ) {
            ...
        }
        finally {
            ...
        }
  * Added support for simulating Toybox.ActivityMonitor data in the simulator.
  * Added tone and vibrate support in the simulator.
  * The permission for using the Toybox.Position module has changed from "Position"
    to "Positioning".
  * Added several new samples.
  * Various bug fixes.
Known Issues
  * When extending a class, the full class name must be used, i.e.
        module Module {
            class A {}
            class B extends Module.A {}
        }
    The using keyword can still be used in place of the full class name.
  * Power and swim fields are not available from the Activity module.
  * SimpleDataFields do not currently accept strings as documented.
  * Formatting issues from makeJsonRequest sometimes causes responses to not be parsed.
  * In the Windows simulator, apps will share an object store. A workaround will be to either
    use Application.AppBase.clearProperties() or to delete %TEMP%\GARMIN\APPS\DATA\APP.str.
v0.2.1
  * Added Attention API (tones, vibrate, and backlight).
  * Added a progress bar and confirmation dialog.
  * Added a time zone offset field to the ClockTime object.
  * Added 64 color support to compiler and simulator. When compiling for a device which
    supports 64 colors the compiler will make use of all the colors to better dither the
    image. A developer can specify a palette to use when compiling an image:
        <bitmap id="AmericanFlag" filename="images/american_flag.png">
            <palette>
                <color>FF0000</color>
                <color>FFFFFF</color>
                <color>0000FF</color>
            </palette>
        </bitmap>
    If a palette is specified the compiler will take each specified color and map it to the
    closest color in the device palette. The image is then compiled using only those colors.
  * Added launcher icon support. The launcher icon and app name must now be specified as
    resource IDs. The launcher icon is optional (a default icon will be compiled in). If
    resources are specified as:
        <resources>
            <string id="AppName">My App</string>
            <bitmap id="LauncherIcon" filename="images/launcher_icon.png" />
        </resource>
    The app name and launcher icon in the manifest would be:
        <iq:application name="AppName" launcherIcon="LauncherIcon">
    The manifest file for existing projects must at least specify a name as a string
    resource or they will not compile.
  * Added support for Linux simulator.
  * Restrict input to widget and watch-app type Connect IQ apps. Widgets will no longer
    receive the swipe left and swipe right inputs for their base View.
  * General bug fixes to the compiler.
  * General bug fixes to the simulator.
Known Issues
  * Ant support on Linux is untested.
v0.2.0
  * Added support for suspending an app.
  * Added an option to disable dithering.
  * Fixed layouts and overriding issues with resource compiler.
  * General bug fixes to the simulator.
Known Issues
  * Current pace, power fields and swim fields are not available from the Activity module.
  * SimpleDataFields do not currently accept strings as documented.
  * Formatting issues from makeJsonRequest sometimes causes responses to not be parsed.
  * SDKs downloaded using the SDK Manager in OSX will not run without giving the files
    execute permissions.
v0.1.1
  * Added the 920XT as one of the products you can develop for.
  * Added Dc.getFontHeight(font) to get the height of fonts.
  * drawText now handles \n.
  * Fixed an issue with bike cadence being invalid.
  * There was an issue with do/while loops not executing correctly that was address.
  * The keywords 'break' and 'continue' were added. We will never speak of this again.
  * Arrays were having an out of bounds error when adding items to the last element.
  * The time zone should now be correct when testing watch faces.
  * Fixed a memory leak when using Durations or Longs with simple data fields.
v0.1.0
  * Added support for complex data fields. These data fields receive the same sensor data
    as a simple data field but can draw custom graphics for the field.
  * Added support for ANT in the API under Toybox.Ant and in the simulator. Devices that
    operate on the public and Ant+ networks can be communicated with
    using the new API.
    Note: In the simulator the ANT device must be a few feet from the USB ANT stick.
          On OS X only usb2 and usbm sticks are supported. Ensure that no other programs
          are using the USB ANT stick on your computer.
  * Added support for BLE simulation in the simulator over ADB. Choose Connection > Start
    in the simulator for instructions on how to configure ADB. Support for BLE
    communications with iOS devices are currently not supported.
  * General bug fixes to the simulator.
v0.0.21
  * Added support for FIT file playback in the simulator. This is available in the
    FIT Data menu.
  * Added support for FIT simulation in the simulator.
  * Added App permissions. Apps must request permissions for certain modules in
    their manifest.xml file. Apps must request permission to use the following
    modules: ActivityRecording, Communications, Position, and Timer.
  * Added support for timers. A timer can be started to call a callback after a certain
    amount of time. Timers are available in the Toybox.Timer.Timer class.
  * Added subString() and find() to String.
  * Added support for data field app types.
  * Added support for ++, —-, and NaN.
  * Added the ability to request images in the simulator.  See
    Communications.makeImageRequest() for details.
  * Add the ability to close the current running app and to take screenshots in
    the simulator.
  * General bug fixes to the simulator.
Known Issues
  * monkeydo on OS X does not work if a path is included in the argument.
    For example, monkeydo Analog.prg works while monkeydo bin/Analog.prg does not.
  * Speed, altitude, and position are not available for simulated FIT data. They
    are available when playing back a FIT file.
  * The heart rate value in the Sensor.Info object always returns 0.
v0.0.20
  * Moved requestUpdate() from View to WatchUi.
  * Simulator now has an interface for json, MakeJsonRequest.
  * Resources have been moved into Rez as submodules.
  * Simulator supports string resources and the language can be changed via
    the language menu.
  * Menu support has been added in the simulator.
  * Prevent bad memory access on app close.
  * New compiler option for Devices so that the devices.xml can be supplied.
  * Notifications in the simulator have been fixed.
  * Sensor API has been added.
  * The simulator can now accept a Device ID on launch.
  * Compiler can now test a function to make sure variables are initialized and
    return values can also be tested.
  * The plug-in now supports widgets.
  * Fixed bug in hash delete.
  * Fixed a buffer overrun in string copying.
  * Added NumberPicker API.
  * Fixed bug with long/double handling.
  * Fixed a bug in reading strings from the application.
  * Removed WatchUi.PUSH_MENU.
v0.0.19
  * Added manifest editor to the plugin.
  * Added input handling. An input delegate is included when pushing a view.

        // In getInitialView() in the AppBase
        return [ new BaseView(), new BaseInputDelegate() ];
        // Using Ui.pushView()
        Ui.pushView(new SecondView(), new SecondInputDelegate(), Ui.SLIDE_IMMEDIATE );

  * Added long and double support. The syntax for a long and double is to
    append a 'l' or 'd' respectively.

        var myLong = 345l;     // long
        var myDouble = 5.67d;  // double

  * Improved stability of the simulator.
v0.0.18
  * Replaced WatchUi.Page with WatchUi.View
  * Fix boundary checking bug in arrays.
  * Added the Mailbox API - Allows Apps to open and read from a
    mailbox containing messages received over BLE.  At this time,
    the mechanism for receiving messages is not complete, so this
    API is limited in capablity.
  * Fixed a memory counting bug when using the isa operator
  * Fixed a memory counting bug when inserting objects over top of
    themselves in arrays, hashes, and objects
  * Added handling of null to the == operator so that 0 is not equal to null
  * Added the ActivityRecording API - Allows Apps to access the native
    FIT Activity Recording capabilities of Garmin devices. Apps can create
    a new session, and control the activity timer.
  * Fixed a bug in Dictionary.put causing all keys to return null
  * Fixed bug where object type wasn't checked when inserting into
    a hash
  * Swapped the color order in the drawable setColor function.
  * Added getWidth and getHeight methods to the bitmap resource.
  * Add Positioning API - Apps are allowed to subscribe to position events.
    The Location object provides an abstract way for developers to work
    with coordinates
  * Added entry point to the project manifest file, and Changes entry
    point names to UUID.  All projects must specify an entry point and
    UUID in the manifest file.  The manifest compiler option (-m) is
    now mandatory.
  * Added support for object storage - This allows an app to persist
    properties across runs.
    Toybox.Application.AppBase.setProperty( key, value ) can be used
    to store data while AppBase.getProperty( key ) can be used to retrieve
    it. Access to the currently running Application can be retrieved via
    Toybox.Application.getApp() so objects outside of the entry point
    have access to the object store.
  * Add input handling to simulator by using InputDelegates - See the
    Programmer's Guide for more details.
  * Fixed an issue causing the simulator to attempt to log some errors
    more than once.
  * Allow inheritance in the API and user modules - Fixes a bug in the
    compiler that prevented API classes from inheriting from one another
    and only allowed user classes to inherit from a class in the global
    module.
  * Added XML Drawables and Drawables class - A list of shapes and bitmaps
    can be defined in XML which will then be compiled into a Monkey C object
    See the Programmer's Guide for more details.
  * Added options to remove trailing whitespace and convert tabs to spaces
  * Fixed bug where keywords could be highlighted inside other words.
v0.0.15
  * Mac Support - The SDK now run Windows and Mac OS X.
  * New Simulator - We are no longer using the product simulator as the
    Monkeybrains simulator. This is the first SDK release using this
    simulator.
  * Initializers - In the past module/instance variables could only be
    initialized to constant numbers or strings. Now you can initialize
    using an expression.

    module Foo
    {
      var value = new Value();
    }

  * Added text support into the resource compiler
  * Added the Package tool for app deployment
  * Many changes to the Monkey Brains Plug-in
v0.0.14
  * Enums have had their type names removed and now
    use common prefixes.
  * Static methods in classes have been made part of their
    parent module. This is to avoid the Module.Class.method()
    syntax.
  * System.rand() is now part of Math
  * Lang.String.format is now Lang.format
  * Toybox.Ui is now Toybox.WatchUi
  * Dc.drawText now supports text justification
  * Using clauses no longer require the as portion
  * Content Assist of Eclipse plug in now supports function parameters
  * Run configuration now supports device
v0.0.13
  * Added Date/Calendar support. There are two new MB classes in
    the Time module - Moment and Duration. A Moment represents a
    fixed point in time, while a Duration represents a period of time.

    The Gregorian module allows the conversion from Gregorian date constructs
    to Moment objects. This allows for getting a Moment as follows

        // When the Flux capacitor was conceived
        var date = Gregorian.moment({:year=>1955, :month=>:november, :day=>5});

        var duration = Gregorian.duration({:days=>5});

        var leaveDate = date.add(duration);

    Gregorian was separated from the Time module to support other calendar
    formats, though admittedly, it would take serious to support anything
    other than Julian, and I don't see the rise of the Roman empire coming
    anytime soon.
  * Resources are no longer loaded by default - a page has to explicitly
    load them. To load a bitmap or font, use Ui.loadResource

      var resource = Ui.loadResource(Rez.ID_RESOURCE);

    Once the instance exists, you can reference it where you formerly
    passed in the resource id.
  * The binary format of executables has completely changed into a new
    extensible format.
  * Support for dynamically enumerating applications at startup now exists.
  * MB compiler now supports a device flag that specifies what device
    to generate resources for.
  * Bug fixes in the Plug-in that was causing lockups when the resource
    compiler failed.

v0.0.12
  * Bitmap Font support. Resource compiler now supports converting
    fonts from BMFont (http://www.angelcode.com/products/bmfont/)
    Bitmap fonts can be passed into the same methods as the
    Graphics.Font declarations.
  * String class now has a static format() method for doing string
    manipulation. Format is similar to TXT_format_string in that
    it will reformat order (useful in translations).

      var result = Lang.String.format("$1$ $2$",[firstName, lastName]);

  * Number and Float now have a format method that allows for
    converting their values into strings of different formats.
    It supports the same conversions of printf for ints and
    floats.

      var x = 5;
      var y = x.format("02"); // Convert to "05"

  * Added size(), isEmpty(), keys(), and values() to Dictionary
  * Added instanceof and has operators. This allows for runtime
    type checking and method support.

    // Check if object has the print method
    if (value has :print) {
      value.print();
    }

  * Using clause is now handled internally by the compiler instead
    of at runtime. This should give a performance boost.
  * Added Color.TRANSPARENT
  * Added a dynamic link table to Monkey C executable. This fixes
    issue where generated binaries only worked on matching API runtimes.

v0.0.11
  * Dictionary support. You can now create a dictionary with the
    following syntax.

      var x = new {}; // New dictionary

      var y = { 1 => "Hello", 2 => "World" }; // Initializer syntax

    Dictionaries dynamically resize and rehash themselves. See
    the Dictionary object documentation
  * Added annotation support. Annotations are symbols that can
    be associated with a class, variable, or function. Annotations
    are written as a list of symbols surrounded by ()

      (:persistable :testOnly) class Person
      {
        var first_name;
    var last_name;
      }

    This will allow adding new features to the language without changing
    the language grammar. For now, annotations are written to the debug XML
  * Fixed an issue with numeric strings
  * Fixed an issue with spaces in file names of source files
  * Fixed the double launch delegate issue
  * Fixed issue with builder ignoring resources

v0.0.10
  * Includes the Eclipse Plug-in for integrated development environment.

v0.0.9
  * Adding the new [1, 2, 3] array syntax to pre-fill an
  array
  * Added fillPolygon, which takes an array of arrays (x,y)
  coordinates.
  * Added System.getClockTime to get the current UTC time.
  * Added the Math package with trig and other functions
  * Added System.getSystemStats() to get battery power and free memory
  * Changed argument of Dc.drawText to allow passing of font.

v0.0.8
  The toybox modules were switched from lowercase to CamelCase.
  Originally I was naming them like Java packages, but MB
  modules are more like objects than just lexical naming, so
  I thought it made sense for them to share the naming
  convention of objects. To make things more confusing, I
  renamed the methods from underscore_style to camelCaseStyle,
  as a concession to the Java programmers. Basically, you
  can all begin hating me... NOW.

  Constructors! Now when you instantiate a class the initialize()
  function will be called. You can pass arguments to it like a regular
  function.

  You can now use the :symbol syntax to create/use a symbol. This
  is used by the method() Object method to allow you to get
  a Method object. You can also get object members using the
  object[:symbol] syntax.

  The new Method object allows you to create a callback object.
  You can create a method using
    var m = object.method(:method_name)
  You can then call the method using
    m.invoke(parameter list);


  Much of the Page management has been moved to the Ui package. There
  is now a PageManager class that you use to push pages onto the
  page stack. You can also create user menus to let the user select
  an item in a list.

  A resource compiler has been added to the Monkey C compiler.
  Currently it only supports bitmaps, but it will hopefully support
  localized text in the near future. You can read more about it's
  use at https://confluence.consumer.garmin.com/display/~kralnic/Programmers+Guide#ProgrammersGuide-ResouceCompiler

  Many bug fixes with expressions and initializers.


v0.0.7 - Additional hardening
 Added support for "X=", where X is *.%+-<<>>&^|
 Fixed an issue where String initializers were generating bad code
 Added the hidden and const keywords
 Added the ability to call superclass methods.

v0.0.6 - Fixing issues with && and || and !=
 Not equals was not working. Whoops.

 The precedence of logical and and or was at the wrong
 level, which was causing issues. They have been lowered
 below other operators. Also, logical and will now skip
 over the second expression if the first expression is
 false.

 logical and and or now short circuit.

v0.0.5 - Added the using clause
 You can import a module now with the using clause.

 class Foo
 {
     using toybox.system as Sys;

     function bar()
     {
         Sys.print("Hello");
     }
 }

 The using clause adds a symbol to your current class or module
 that lets you directly reference a foreign module without having
 to search up the global hierarchy. In a future change, you will
 be able to use using clauses with class extends.

v0.0.4 - Now with better numbers!
 Added the to_f()/to_i() methods to Number and Float to do casting
 operations.
 Fixed set_color so fill_rectangle now works
 Added set_update_rate so an app can set it's refresh rate (in ms).

v0.0.3 - Now with numbers!
 A number of the basic math operations like floating point and bitwise
 operations were not implemented. This adds floating point, bit shifting,
 logical and bitwise and and or, null, true, and false.

v0.0.2 - Now with static cling!
 * Added the ability to have static members of classes with 'static' keyword
 * Made global static table for modules and static members
 * Added toybox.system.get_timer to get TSK timer

v0.0.1 - Initial release

-- TODO / BROKEN --

Things I know don't work.

* Colors on Mac OS X simulator are odd
* Goes on...


