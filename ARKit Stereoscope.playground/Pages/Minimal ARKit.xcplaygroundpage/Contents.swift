
// ARKit-Stereoscope
// Copyright (c) 2019 Hartwell Fong. All rights reserved.
//
// Updated Feb 7, 2019.
//
// minimal codes to start ARKit, SceneKit (attact a virtual camera for lefteye to ARKit iPad camera righteye to make a stereoscope)
// no error checking
// codes hardwired for Apple 2018 9.7" iPad introduced at Apple Special Event March 27, 2018 in Chicago
// same codes as Goclenius but with 3D files removed and dark background, look around a lit room to see how ARKit works (eg. wall with things, blank wall, different lighting)

import ARKit
import PlaygroundSupport

var righteye = ARSCNView()
var right = SCNScene()
righteye.scene = right
righteye.scene.background.contents = UIColor.black
righteye.showsStatistics = true
righteye.automaticallyUpdatesLighting = false

var lefteye = SCNView()
var left = SCNScene()
lefteye.scene = right
lefteye.showsStatistics = true

let config = ARWorldTrackingConfiguration()
righteye.session.run(config)

righteye.debugOptions = [
    ARSCNDebugOptions.showFeaturePoints,
    ARSCNDebugOptions.showWorldOrigin
]

var ipd = -0.063 // interpupillary distance (meter)
var cameraNode = SCNNode()  // make camera for left eye
let camera = SCNCamera()
camera.xFov = 43  // these four variables depend on righteye.frame 
camera.yFov = 41
camera.zFar = 1000
camera.zNear = 0.1
cameraNode.camera = camera
cameraNode.position = SCNVector3(ipd,0,0)
righteye.pointOfView?.addChildNode(cameraNode)

lefteye.pointOfView = cameraNode

lefteye.isPlaying = true

// codes hardwired for The Owl Stereoscopic Viewer from The London Stereoscopic Company Ltd https://www.londonstereo.com
// the stereoscope is used with a 9.7" iPad in portrait orientation lock on

var imageView = UIImageView()

lefteye.frame = CGRect(x: 0, y: 0, width: 344, height: 340)
imageView.addSubview(lefteye)

righteye.frame = CGRect(x: 344, y: 0, width: 344, height: 340)
imageView.addSubview(righteye)

PlaygroundPage.current.liveView = imageView

// in last line, change imageview to righteye if don't have a stereoscope
// or observe differences between mono and stereo views (stereopsis)

