# Windows 'Feature' Add-Ons
1. Launch the EXE File

## [Scroll Multiple windows Side by Side at Once](https://github.com/Kennethkcpdhs/functiona1-windows/tree/master/multi-scroll)
1. Alt-W or change to a key of your choice to reset the script
2. Alt-A. Click on the two windows which you intend to scroll at the same time.
3. Scroll.. may have some bugs

#### Problems and Improvements:
- Implementing scroll based on length of document, or common words (if exists)

## [Control Volume and Change Music Track(*Limited*) for Spotify Web Player](https://github.com/Kennethkcpdhs/functiona1-windows/tree/master/mediacontrol)
1. Ctrl-k and l to increase or lower volume respectively
2. Ctrl-i,o,p to go backwards, pause or forward the music track

#### Problems and Improvements:
- Need to restore original tab better
- Choice of key is terrible
- Software control would be better than gui-control
- Only works on firefox for now

## [Turns Screen off via mouse position](https://github.com/Kennethkcpdhs/functiona1-windows/tree/master/screenoff_mouse_pos)
1. Launch the EXE File
2. Bring Mouse to Bottom Right Corner, and screen should turn off
3. Shake Mouse out of bottom right corner, and screen should turn back on

- Due to sleep function, it takes up less system resources, resulting in low CPU Usage <1%
- Makes use of C# Forms (aka GUI) to get mouse position
- Add to Task Scheduler to launch on start
- Automatically detects the resolution of the screen and adjusts accordingly

#### Problems and Improvements:
- Sometimes gets into a wierd recursive loop, likely due to poor readings of mouse coordinates

##### Do check out the awesome [Windows Autohotkey version over here](https://github.com/thepoppycat/WindowsApps) by thepoppycat.

#### If an error popup requires installation of a .NET core 
- go to https://dotnet.microsoft.com/download/dotnet-core/3.1 to install the .NET core framework


## More, coming soon
