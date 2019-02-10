ARKit stereoscope visualizes OBJ files generated from https://trek.nasa.gov/moon.

![](goclenius.gif)

The animated GIF above is from a 2018 Apple 9.7" iPad. The clip shows the iPad moving over a 3D model of Goclenius crater. The yellow dots are ARKit computer vision tracking features points (in this case, the iPad is moving along a bookshelf on the left).

The swift code uses ARKit to track the iPad's movement with 6 degrees-of-freedom which allows Scenekit to display the proper stereoscopic view of 3D models.

# Hardware

1. Apple 9.7" iPad (tested on 2018 model, A9 CPU or higher for ARKit, should work on 2017 model) and running latest iOS
2. The OWL Stereoscopic Viewer(£15.00) from The London Stereoscopic Company Ltd https://www.londonstereo.com/

# Software

1. Apple Swift Playgrounds (2.2) from iOS App Store. Swift Playgrounds lets kids program their iPad directly to experiment with ARKit and Scenekit.
2. Apple Safari for generating 3D OBJ files from NASA Moon Trek
3. Apple Files app from iOS App Store to store and unzip files for Swift Playgrounds to read

<img src="owl-viewer.jpg" width="640">

It is advisable to get a protective silicon case for the iPad to minimize the stereoscope sliding on the screen. The stereoscopic viewer is held in place by the user to allow switching between viewing and programming Swift. "Portrait Orientation Lock" is on as this should be the most comfortable position to hold the iPad with the viewer.

# Installation

In iOS Safari, click the following link, press "Download", and "Open in Playgrounds".

https://github.com/Physicslibrary/ARKit-Stereoscope/blob/master/dist/ARKit%20Stereoscope.playground.zip

ARKit-Stereoscope Playground file started from Blank (Swift 4.2 Edition) template in iOS Swift Playgrounds app.

# How it works

Physicist Rhett Allain gives a great explanation on how ARKit works:

https://www.youtube.com/watch?v=Zf5XffYzvJ8

# Import 3D models from Moon Trek to Swift Playgrounds

There are many ways to move 3D files from Moon Trek to Swift Playgrounds. This is one way using an iPad.

1. Visit https://trek.nasa.gov/moon with Safari
2. Tap magnify glass on upper left to find a crater, eg. goclenius
3. Tap "Goclenius"
4. Tap red "x" to hide, zoom to yellow dot
5. Tap wrench on upper right, tap "Generate 3D Print File"
6. Tap "Rectangle", draw a yellow rectangle around Goclenius
7. "Generate 3D Print File" dialog appears, tap "Cancel"
8. Tap on yellow rectangle, select "Move/Resize Shape"
9. Tap outside yellow rectangle after adjusting
10. Tap on yellow rectangle, "Generate 3D Print", "OBJ"
11. Get "Generate 3D Print File" dialog, set Resolution < 400 (400 gives ~63MB file which Blank playground doesn't like) and "Texture" to one of two options, "Submit", "OK"
12. Wait
13. Get a ~6MB trekOBJ.zip (resolution=300), "More", "Save to Files"
14. "iCloud Drive", "storage", pick a directory, "Add"

To get trekOBJ.zip unzipped is complicated as there are many third-party file manager apps.
Unzipping trekOBJ.zip gives model.obj, terrain.mtl, and texture.png. Put these in iCloud Drive where Playgrounds can access them.

Apple Files app is used here because it works.

15. Open Files app, find trekOBJ.zip
16. Tap trekOBJ.zip, tap "Preview Content"
17. On the top, it says "model (1 of 3)", tap share on upper right, "Save to Files", find a directory, "Add"
18. Swipe the screen left, it says "terrain (2 of 3)", save as before
19. Swipe the screen left, "texture (3 of 3)", "Save to Files" again, 
20. Finally, with ARKit-Stereoscope opened in Playgrounds, tap "+", tap paper icon, "Insert From...", find those files in iCloud Drive


