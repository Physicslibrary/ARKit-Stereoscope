/*
 
ARKit-Stereoscope
 
https://physicslibrary.github.io/ARKit-Stereoscope/
 
MIT License
 
Copyright (c) 2019 Hartwell Fong
 
Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the "Software"), to deal in the Software without restriction,
including without limitation the rights to use, copy, modify, merge,
publish, distribute, sublicense, and/or sell copies of the Software,
and to permit persons to whom the Software is furnished to do so, subject
to the following conditions:
 
The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
Updated Mar 8, 2019.

This playground uses ARKit and SceneKit to set up scene, read a 3D file, read 2 images,
and attact a virtual camera for lefteye to ARKit iPad camera righteye to make a stereoscopic image.

Hardware:
 
Apple 9.7" iPad (tested on 2018 model, should work on 2017 9.7" iPad, A9 CPU or higher for ARKit)
 
The OWL Stereoscopic Viewer from The London Stereoscopic Company Ltd
https://www.londonstereo.com
 
Software:
 
Apple Swift Playgrounds (3.0) from iOS App Store
 
Tips:
 
If frame rate <60Hz, press iPad HOME button, return to Swift Playgrounds
 
Experiment with smaller size OBJ files
15MB model.obj was generated from resolution=200 (NASA Moon Trek)
 
The codes doesn't look for a flat plane to put virtual objects on, instead the initial position
of the iPad is the world origin when "Run My Code".

Virtual objects are positioned and oriented to this world origin (with righteye.debugOptions on,
the world origin is an XYZ or RGB axis).

Credits
 
TychoSkymap.t4_04096x02048.jpg
NASA/Goddard Space Flight Center Scientific Visualization Studio
https://svs.gsfc.nasa.gov/3442

model.obj, terrain.mtl, and texture.png
https://trek.nasa.gov/moon
 
*/

import ARKit
import PlaygroundSupport

var righteye = ARSCNView()
righteye.scene = SCNScene()
righteye.scene.background.contents = UIImage(named: "TychoSkymap.t4_04096x02048.jpg")
righteye.showsStatistics = true  // comment out to turn off
righteye.automaticallyUpdatesLighting = false

var lefteye = SCNView()
lefteye.scene = righteye.scene
lefteye.showsStatistics = true  // comment out to turn off
let config = ARWorldTrackingConfiguration()
righteye.session.run(config)

/*
 righteye.debugOptions = [
 ARSCNDebugOptions.showFeaturePoints,
 ARSCNDebugOptions.showWorldOrigin
 ]  // uncomment for testing computer vision
 */

var box = SCNScene(named: "model.obj")!
let node = box.rootNode.childNodes[0]
node.position = SCNVector3(x: 0, y: 0, z: 0)
node.eulerAngles = SCNVector3(-Float.pi/2, Float.pi, 0)
node.scale = SCNVector3(0.01, 0.01, 0.01)
righteye.scene.rootNode.addChildNode(node)

node.geometry?.firstMaterial?.emission.contents = UIImage(named: "texture.png")

// hardwired for Owl Stereoscopic Viewer
// the stereoscope works with a 9.7" iPad in portrait orientation lock on
var ipd = -0.06 // interpupillary distance (meter)
var cameraNode = SCNNode()
let camera = SCNCamera()  // make a camera for left eye
camera.xFov = 43  // camera.* depends on righteye.frame
camera.yFov = 41
camera.zFar = 100 // if clipping, change camera zFar/zNear
camera.zNear = 0.1
cameraNode.camera = camera
cameraNode.position = SCNVector3(ipd,0,0)
righteye.pointOfView?.addChildNode(cameraNode)

lefteye.pointOfView = cameraNode

lefteye.isPlaying = true

var imageView = UIImageView()

lefteye.frame = CGRect(x: 0, y: 0, width: 344, height: 340
)
imageView.addSubview(lefteye)

righteye.frame = CGRect(x: 344, y: 0, width: 344, height: 340)
imageView.addSubview(righteye)

PlaygroundPage.current.wantsFullScreenLiveView = true
PlaygroundPage.current.liveView = imageView

// in last line, change imageview to righteye for mono view
// observe differences between mono and stereo views (stereopsis)
