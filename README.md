DVDScreenSaver
==============

A recreation of the nostalgic Bouncing DVD Screen Saver for macOS. 
See it in action as a gif below
![DVD Bouncing Around](https://media.giphy.com/media/1UMZpB0IYW4h4xdnUs/giphy.gif).


Installation
------------
1. Download DVDBounce.saver.zip
2. Unzip to obtain DVDBounce.saver
3. Double Click this .saver file. System Preferences (Desktop/Screen Saver tab) will open and will prompt you for an install.

Build From Source
-----------------
1. Use the provided .xcodeproj OR make a new Xcode Project
2. Select Screen Saver
3. You wil be given a .h and .m file, substitute these (through copy paste, or directly replacing them) with bouncesaver.(h,m) from this repo. 
4. Make sure to include dvdlogo.png in your project and make sure it is copied to the bundle during building (Build Phases -> Copy Bundle Resources, Copy Files). 
5. Build the project.
6. Find the target (bouncesaver.saver) and view in Finder. 
7. Double click bouncesaver.saver and install using System Preferences (Desktop/ Screen Saver). 

Trouble Shooting
----------------
1. Sometimes you have to select the screen saver within System Preferences, then quit System Preferences, and restart for the saver to load. 
