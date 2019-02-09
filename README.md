ARKit stereoscope visualizes OBJ files generated from https://trek.nasa.gov/moon.

![](goclenius.gif)

The animated GIF above is from a 2018 Apple 9.7" iPad. The clip shows the iPad moving over a 3D model of Goclenius crater. The yellow dots are ARKit computer vision tracking features points (in this case, the iPad is moving along a bookshelf on the left).

The swift code uses ARKit to track the iPad's movement with 6 degrees-of-freedom which allows Scenekit to display the proper stereoscopic view of 3D models.

# Hardware

1. Apple 9.7" iPad (tested on 2018 model, A9 CPU or higher for ARKit, should work on 2017 model) and running latest iOS
2. The OWL Stereoscopic Viewer(£15.00) from The London Stereoscopic Company Ltd https://www.londonstereo.com/

# Software

1. Apple Swift Playgrounds (2.2) from iOS App Store. Swift Playgrounds lets kids program their iPad directly to experiment with ARKit and Scenekit.
2. Apple Safari for generating 3D OBJ files from NASA Moon Trek and Apple Files (both come with iOS) to store and unzip those files for Swift Playgrounds to import.

<img src="owl-viewer.jpg" width="640">

It is advisable to get a protective silicon case for the iPad to minimize the stereoscope sliding on the screen. The stereoscopic viewer is held in place by the user to allow switching between viewing and programming Swift. "Portrait Orientation Lock" is on as this should be the most comfortable position to hold the iPad with the viewer.

# Installation

In iOS Safari, click the following link, press "Download", and "Open in Playgrounds".

https://github.com/Physicslibrary/ARKit-Stereoscope/blob/master/dist/ARKit%20Stereoscope.playground.zip

ARKit-Stereoscope Playground file started from Blank (Swift 4.2 Edition) template in iOS Swift Playgrounds app.

# How it works

Physicist Rhett Allain gives a great explanation on how ARKit works:

https://www.youtube.com/watch?v=Zf5XffYzvJ8

# How to make 3D files from NASA Moon Trek...
