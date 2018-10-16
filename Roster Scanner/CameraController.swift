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
    
    enum CameraControllerError: Swift.Error {
        case captureSessionAlreadyRunning
        case captureSessionIsMissing
        case inputsAreInvalid
        case invalidOperation
        case noCamerasAvailable
        case unknown
    }
    
}
extension CameraController {
    
    func prepare(completionHandler: @escaping(Error?) -> Void) {
        func createCaptureSession() {
            captureSession = AVCaptureSession()
        }
        func configureCaptureDevices() throws {
            let session = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaType.video, position: .back)
            for camera in session.devices {
                if camera.position == .back {
                    self.camera = camera
                    try camera.lockForConfiguration()
                    camera.focusMode = .continuousAutoFocus
                    camera.unlockForConfiguration()
                }
            }
        }
    }
}
