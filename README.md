An ARKit stereoscope visualizes OBJ files generated from https://trek.nasa.gov/moon.

![](goclenius.gif)

The animated GIF is captured from a 2018 Apple 9.7" iPad. The clip shows the iPad moving over a 3D model of Goclenius crater. The yellow dots are ARKit computer vision tracking feature points (iPad is moving along a bookshelf on the left).

The Swift code uses ARKit to track the iPad's movement with 6 degrees-of-freedom which allows Scenekit to display the proper stereoscopic view of 3D models (eg. like Valve HTC Vive or Oculus Rift).

In addition to Moon Trek, there are other treks to experiment ARKit-Stereoscope with. Go to "Related Links" on trek.nasa.gov for more treks (eg. Mars Trek).

# Hardware

1. Apple 9.7" iPad (tested on 2018 model, A9 CPU or higher for ARKit, should work on 2017 model).

2. The OWL Stereoscopic Viewer(£15.00) from [The London Stereoscopic Company Ltd](https://www.londonstereo.com/)

   Beside using it to view 3D models with tracking, it can also be used, in a browser (no ARKit needed), to view stereoscopic images on [Library of Congress](http://www.loc.gov/pictures/collection/stereo/) or [New York Public Library](https://stereo.nypl.org/).

   For more current images, try [London Stereoscopic Company Ltd](https://www.londonstereo.com/3-D-gallery1.html).

   Typing "stereograph" or "stereoscope" in Google Images gives more examples.
   
# Software

1. Apple Swift Playgrounds (2.2) from iOS App Store. Swift Playgrounds lets kids program their iPad directly to experiment with ARKit and Scenekit.
2. Apple Safari for making 3D OBJ files from NASA Moon Trek
3. Apple Files app from iOS App Store to store and unzip files for Swift Playgrounds to read (not required if already have own file manager app to unzip and organize files)

<img src="owl-viewer.jpg" width="640">

It is advisable to get a protective silicon case for the iPad to minimize the stereoscope sliding on the screen. The stereoscopic viewer is held in place by the user to allow switching between viewing and programming Swift. "Portrait Orientation Lock" is on as this should be the most comfortable position to hold the iPad with the viewer.

# Installation

In iOS Safari, click the following [link](https://github.com/Physicslibrary/ARKit-Stereoscope/blob/master/dist/ARKit%20Stereoscope.playground.zip), press "Download", and "Open in Playgrounds".

The ARKit-Stereoscope Playground file was created from the Blank (Swift 4.2 Edition) template in iOS Swift Playgrounds app.

# How it works

Physicist Rhett Allain gives a great explanation on how ARKit [works:](https://www.youtube.com/watch?v=Zf5XffYzvJ8)

# Import 3D models from Moon Trek to Swift Playgrounds

There are many ways to move 3D files from Moon Trek to Swift Playgrounds. This is one way using an iPad.

Visit https://trek.nasa.gov/moon with Safari

A helpful tutorial dialog box usually come up (desktop browser) but does not on the current mobile Safari (or Firefox). So here is short quick start.

Magnify glass on top left to find a crater, eg. goclenius<br>
Tap "Goclenius"<br>
Red "x" to hide<br>
Zoom to yellow dot<br>
Wrench on top right<br>
"Generate 3D Print File"<br>
"Rectangle"<br>
Draw a yellow rectangle around Goclenius<br>
"Generate 3D Print File" dialog appears<br>
"Cancel" (to make adjustment)<br>
Tap on yellow rectangle<br>
"Move/Resize Shape"<br>
Tap outside yellow rectangle to finish<br>
Tap on yellow rectangle<br>
"Generate 3D Print"<br>
"OBJ"<br>
Get "Generate 3D Print File" dialog<br>
Set Resolution < 200 (default 400 gives ~63MB file which Blank playground doesn't like) and "Texture" to one of two options<br>
"Submit"<br>
"OK"<br>
Wait<br>
Get ~6MB trekOBJ.zip (resolution=200)<br>
"More"<br>
"Save to Files"<br>
"iCloud Drive"<br>
"storage"<br>
"Add"

To get trekOBJ.zip unzipped is complicated as there are many third-party iOS file manager apps.
Unzipping trekOBJ.zip gives model.obj, terrain.mtl, and texture.png. Put these in a location where Playgrounds can access them.

Tip: If no third-party file manager, then Apple Files app can be used.

Open Files app<br>
Find trekOBJ.zip<br>
Tap trekOBJ.zip<br>
"Preview Content"<br>
Get "model (1 of 3)"<br>
Tap share on top right<br>
"Save to Files"<br>
Pick a directory<br>
"Add"<br>
Swipe the screen left<br>
Get "terrain (2 of 3)"<br>
Save as before<br>
Swipe the screen left<br>
Get "texture (3 of 3)"<br>
"Save to Files"<br>
Open ARKit-Stereoscope in Playgrounds<br>
Tap "+"<br>
Tap paper icon<br>
"Insert From..."<br>
Find model.obj and texture.png<br>


