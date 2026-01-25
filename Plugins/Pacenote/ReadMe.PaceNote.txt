
Pacenote Plugin (Version 2.0) for RBR 1.02 SSE
================================================

This plugin for Richard Burns Rally features a pacenote editor, an enhanced
pacenote callout handler, a camera editor, a car damage indicator, and a
telemetry recorder.


Pacenote Editor
---------------
* edit and save pace notes of all types of tracks (Standard RBR, add-on, BTB)
* add, edit and delete pace notes
* edit pace notes in normal driving mode
* edit pace notes while watching a replay
* changed pace notes are immediately active and recognized by RBR
  (no reloading of the stage required)
* add arbitrary custom pace notes by defining new pace note IDs
* prevent the emission of AND/INTO/ONTO calls between adjacent pace notes
* move the callout of a pace note forward or backward dynamically without
  actually changing the location of the pace note
  * move by time (callout time)
  * move by distance (callout distance)
  * move by deceleration value "a"
    (callout adjust with car velocity "v", [dist = 0.5*(v*v)/a])
  Remember that the standard "callout distance" specified in the pacenote
  options of RBR has always a fixed value (one square = 0.5s).
* configure the editor UI to suit your needs by grouping the pace notes into
  user defined categories
* specify the index of the sound file to be played for a group of calls
* specify the sound file to be played for each pacenote call
* switch between different styles of pacenotes (descriptive, numeric ect.)

Additional features:
* jump forward or backward to any location on the stage in driving mode as
  well as in replay mode
* halt and resume replay, e.g. to edit pace notes
* show enhanced FPS
* show camera position and direction
* show driveline bar
* show the HUD/DASH in replays
* mute pacenote callouts separately in game and replay mode
* suppress the "wrong way" message

* save the pace notes directly into the original DLS file while remaining
  backward compatible (new IDs would simply be ignored by standard RBR)
* save the pace notes to a BTB "pacenotes.ini" file
* load pace notes from an INI file in BTB format (not limited to BTB tracks)
* export the pace notes in a tabular file format for importing into your
  favourite spreadsheet application (TSV)
* map any custom call to a legacy call to be used by the standard RBR callout
  handler if no plugin installed

Toggled by double clicking the LEFT mouse button.


Pacenote Callout Handler
------------------------
* replace any pace note callout sound with custom OGG sound files
* emits already "visited" pace notes again if you move your car a bit
  backwards
* emits pace note callouts during replay (optional)
* callouts mutable


Camera Editor, Dash Positions, Replay Speed, Telemetry Recorder
---------------------------------------------------------------
* edit the standard RBR cameras (cam_bonnet, cam_bonnet2, cam_internal) in an
  easy-to-use dialog in driving mode as well as in replay mode (WYSIWYG)
* save the changes to the car specific INI file
* add, edit and save an unlimited number of user-defined cameras stored in a
  separate config file (cameras.ini)
* edit the x/y positions of the mini and full dash
* save and restore the dash positions into/from a separate INI file

* slowmotion and fast forward in replay mode
* mute replay pace note callouts

* telemetry recorder requires NGP plugin version 7.4 or higher
* telemetry data files are stored in the Plugins/NGP/telemetry folder
* telemetry data record sets are configured in Plugins/NGP/Telemetry.ini

Toggled by double clicking the RIGHT mouse button.


Car Damage Indicator
--------------------
* lists the damage level of each part of the car in a sorted list
* sortable by part name or severity, ascending or descending

Toggled via the "Extras" menu in the Pacenote Editor.


Basically the window position and size can be saved for each window by closing
via the close button (the "X" in the upper right corner of the title bar).


Installation
---------------------------------------------------------------------

Extract the contents of the Pacenote plugin installation archive into your RBR
installation folder, which probably is something like
"C:\Games\Richard Burns Rally".


Prerequisites:

I. This plugin needs RBR patch 1.02 SSE and NGP 7.4 or newer to work properly.


II. Microsoft DirectX End-User Runtimes (June 2010 or later)

Download this package from the Microsoft Download Center and install as
Administrator. 
If this package is not properly installed the plugin may not work at all.


Uninstallation
---------------------------------------------------------------------

Simply delete the PaceNote.dll file and the Pacenote directory.


Configuration
---------------------------------------------------------------------

The configuration file "Pacenote.ini" in the Plugins folder allows you to
configure the plugin.

For details see the comments in the file "Pacenote.sample.ini".


Limitations
---------------------------------------------------------------------

This version does not support the NOSSE executable. Processors not
supporting the SSE instruction set are now more than 10 years old, so only few
people, if any, might use such a machine for playing RBR.

RBRDLL is not compatible with this plugin.


Notes
---------------------------------------------------------------------

- The plugin's UI dialog page shows the state of the features.


Disclaimer of Warranty
---------------------------------------------------------------------

This software and the accompanying files are supplied "as is" and
without warranties as to performance or merchantibility or any other
warranties whether expressed or implied. No warranty of fitness for
a particular purpose is offered.



Version History
---------------------------------------------------------------------

2.0.779   2025-03-05
    * updated to NGP revision 779

2.0.778   2024-09-15
    * updated to NGP revision 778

2.0.777   2024-08-04
    * NGP telemetry recorder, requires NGP plugin 7.4

1.14.0  2023-09-13
    * fixed handling of special characters (umlaut etc) in file names
    * adapted to work with multi-core NGP 7.2
    * CEGUI library updated to version 0.8.7 (requires new datafiles!)

1.11.0  2017-08-25
    * new config parameter enableGUI to support VR devices

1.10.0  2015-02-03
    * optimized end scene hook

1.9.0 2015-01-19
    * show replay hud and mute pacenotes switches in config file

1.8.0 2014-09-21
    * added support for online plugins

1.7.0 2014-06-17
    * added french translation and sounds

1.6.0 2013-08-31
    * added czech translation and sounds
    * suppress "wrong way" message (menu)

1.5.1 2013-03-03
    * telemetry data recorder (D I S A B L E D)

1.5 2013-03-02
    * fixed moving of dash at higher resolutions

1.3 2013-01-02
    * show dialogs in countdown and endrace mode
    * no save button in replay tab
    * reset callout handler
    * keep setting of "no link/sticky" attribute when adding subsequent notes

1.2 2012-12-21
    * slowmotion and fast forward in replay
    * mute callouts separately in game and replay mode

1.1 2012-04-07
    * new special "Callout Adjust" pace note
    * show dialogs in game menu mode
    * load pacenotes from BTB formatted ini file
    * "remove all" menu item

1.0 2012-04-01
    * Initial version.



And finally...
---------------------------------------------------------------------

...thanks to Warthog for developing such a great Rally Sim and for
providing the plugin interface.

Credits go to:
* the Czech community for providing their translations and sounds.
* Christophe from the French community for translation and sounds.

WorkerBee

mail to guenter.schlupf at gmx.net

vim: set nocindent :
