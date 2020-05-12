# Use Mac keyboard with AutoHotkey under Windows

This [AutoHotkey](http://www.autohotkey.com/) configuration file makes usual keyboard shortcuts work with an Apple keyboard on Windows. It has been testet with a german keyboard layout, but should work under different layouts as well.

## LudoO remarks

For this fork, I test it with French belgium.
@# are not well managed.
Cmd+a Cmd+s Cmd+arrow.. are added by using this script.
Brackets :

* {} are LeftAlt + ()
* [] are RightAlt + ()
* | => LeftAlt + L

## Known issues

Shift + Alt  are not well supported in general
Shift + Alt + ) => open language bar and change to next language...
Shift + Alt + ( => open win search...

## Classic Macos keyboard shortcuts

[ => Shift + Alt + (
] => Shift + Alt + )
| => Alt + Maj + L
} +> Alt + )
{ => Alt + (
\ => Shift + Alt + /
~ => Alt + n
€ => Alt + $
Display hidden files in dialog => Cmd(⌘) + Shift + .

## Installation

* Install [AutoHotkey](http://www.autohotkey.com/)  (scoop install autohotkey)
* Run the `MacKeyboard.ahk` file
* Put the `MacKeyboard.ahk` file or a shortcut to the file in your Autostart folder to run it automatically on startup.
