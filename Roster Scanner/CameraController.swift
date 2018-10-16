//
//  CameraController.swift
//  Roster Scanner
//
//  Created by Tarang Srivastava on 10/16/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import AVFoundation

class CameraController {
    
    var captureSession: AVCaptureSession?
    
    var camera: AVCaptureDevice?
    var cameraInput: AVCaptureDeviceInput?
    
    var cameraPosition = "rear"; //Fix this to only use rear
    
}
extension CameraController {
    enum CameraControllerError: Swift.Error {
        case captureSessionAlreadyRunning
        case captureSessionIsMissing
        case inputsAreInvalid
        case invalidOperation
        case noCamerasAvailable
        case unknown
    }
}
