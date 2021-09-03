![](goclenius.gif)

The animated GIF is captured from a 2018 Apple 9.7" iPad. It shows the iPad moving over a 3D model of Goclenius crater. The yellow dots are ARKit computer vision tracking feature points (iPad is moving along a bookshelf on the left).

The code uses ARKit to track the iPad's movement with 6 degrees-of-freedom which allows Scenekit to display the proper stereoscopic view of 3D models (eg. like Valve HTC Vive or Oculus Rift).

In addition to Moon Trek, there are other treks to experiment ARKit-Stereoscope with. Go to "Related Links" on https://trek.nasa.gov for more treks (eg. Mars Trek).

# Hardware

1. Tested on Apple 2018 9.7" iPad (A9 CPU or higher for ARKit).

2. The OWL Stereoscopic Viewer(£15.00) from [The London Stereoscopic Company Ltd](https://www.londonstereo.com/)

   Beside using it to view 3D models with tracking, it can also be used, in a browser (no ARKit needed), to view stereoscopic images on [Library of Congress](http://www.loc.gov/pictures/collection/stereo/) or [New York Public Library](https://stereo.nypl.org/).

   For more current images, [London Stereoscopic Company Ltd](https://www.londonstereo.com/3-D-gallery1.html).
   
<img src="owl-viewer.jpg" width="640">

It is advisable to get a protective silicon case for the iPad to minimize the stereoscope sliding on the screen. The stereoscopic viewer is held in place by the user to allow switching between viewing and programming Swift. "Portrait Orientation Lock" is on as this should be the most comfortable position to hold the iPad with the viewer.

# Software

Apple iOS Swift Playgrounds 3.0.

[Swift Playgrounds](https://www.apple.com/ca/swift/playgrounds/)

Swift Playgrounds lets kids ages >4 program their iPad directly and to experiment with ARKit and Scenekit.

# Installation

Apple has updated iOS Swift Playgrounds to 3.0 on May 14, 2019. There is now a way to turn off Playgrounds logging every objects created during runtime (little boxes that appears on the right side when "Run My Code", useful for inspection and debugging but consume memory).

With Playgrounds 3.0 update, the file structure has changed from 2.2.

To keep things simple, a source file learn.swift is available for pasting into Playgrounds. Resources for the program will either be made available or links provided.

Open a new "Blank" template in Playgrounds. Copy and paste the texts of learn.swift.

Press "+" on upper right and select "folded paper" icon. Insert model.obj, texture.png, and TychoSkymap.t4_04096x02048.jpg.

Before "Run My Code", turn off "Enable Results" (next to "Run My Code").

This playground doesn't look for a flat plane to put virtual objects on, instead the initial position of the iPad is the world origin when "Run My Code" is pressed.

Virtual objects are positioned and oriented according to this world origin (with righteye.debugOptions on, the world origin is the XYZ or RGB axis).

If frame rate <60Hz, hold iPad still, swipe up from bottom edge of screen for Home screen (or press HOME button), return to Playgrounds.

# Credits
 
 TychoSkymap.t4_04096x02048.jpg<br>
 NASA/Goddard Space Flight Center Scientific Visualization Studio<br>
 https://svs.gsfc.nasa.gov/3442<br>
 
 model.obj, terrain.mtl, and texture.png<br>
 https://trek.nasa.gov/moon<br>

# How it works

Physicist Rhett Allain gives a great explanation on how ARKit [works:](https://www.youtube.com/watch?v=Zf5XffYzvJ8)

# How to make 3D models from Moon Trek and import to Playgrounds

Visit https://trek.nasa.gov/moon with iOS Safari.

A tutorial dialog box "Welcome to Moon Trek" should appears. If not, tap "Share" icon and "Request Desktop Site".

Search for "Goclenius crater"<br>
"Generate 3D Print"<br>
Get "Generate 3D Print File" dialog<br>
Toggle "OBJ"<br>
Set Resolution < 200 and "Texture" to one of two options<br>
(default 400 generates a >60MB file, get "Problem Running Playground", probably too large for Playgrounds Blank template)<br>
Get ~6MB trekOBJ.zip (resolution=200)<br>
Select "More"<br>
"Save to Files"<br>
"iCloud Drive"<br>
"storage"<br>
"Add"

To get trekOBJ.zip unzipped is complicated as there are many third-party iOS file manager apps.
Unzipping trekOBJ.zip gives model.obj, terrain.mtl, and texture.png. Put these in a location where Playgrounds can access them.

Tip: If no third-party file manager, Apple Files (iOS App Store) can be used to store and unzip files for Swift Playgrounds.

Open Files app<br>
Find trekOBJ.zip<br>
Tap trekOBJ.zip<br>
"Preview Content"<br>
Get "model (1 of 3)"<br>
Tap "Share" icon<br>
"Save to Files"<br>
Pick a directory<br>
"Add"<br>
Swipe screen left<br>
Get "terrain (2 of 3)"<br>
Save as before<br>
Swipe screen left<br>
Get "texture (3 of 3)"<br>
"Save to Files"<br>
Open ARKit-Stereoscope in Playgrounds<br>
Tap "+"<br>
Tap paper icon<br>
"Insert From..."<br>
Find model.obj and texture.png<br>

<br>Copyright (c) 2019 Hartwell Fong
