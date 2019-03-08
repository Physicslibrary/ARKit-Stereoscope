/*
 
 ARKit-Stereoscope
 
 https://physicslibrary.github.io/ARKit-Stereoscope/
 
 MIT License
 
 Copyright (c) 2019 Hartwell Fong
 
 Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated
documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to
whom the Software is furnished to do so, subject to the
following conditions:
 
 The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Updated Mar 8, 2019.
 
 Same as Goclenius but with 3D file removed and black background, look around a lit room to see
how ARKit works (eg. wall with things, blank wall, objects, different lighting).
 
 */

import ARKit
import PlaygroundSupport

var righteye = ARSCNView()
righteye.scene = SCNScene()
righteye.scene.background.contents = UIColor.black
righteye.showsStatistics = true
righteye.automaticallyUpdatesLighting = false

var lefteye = SCNView()
var left = SCNScene()
lefteye.scene = righteye.scene
lefteye.showsStatistics = true

let config = ARWorldTrackingConfiguration()
righteye.session.run(config)

righteye.debugOptions = [
    ARSCNDebugOptions.showFeaturePoints,
    ARSCNDebugOptions.showWorldOrigin
]

var ipd = -0.063 // interpupillary distance (meter)
var cameraNode = SCNNode()
let camera = SCNCamera()  // make a camera for left eye
camera.xFov = 43  // camera.* depend on righteye.frame 
camera.yFov = 41
camera.zFar = 100
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

PlaygroundPage.current.liveView = imageView

// in last line, change imageview to righteye for mono view
// observe differences between mono and stereo views (stereopsis)

