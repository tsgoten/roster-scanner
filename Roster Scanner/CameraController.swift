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
    var photoOutput: AVCapturePhotoOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
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
        func configureDeviceInputs() throws {
            guard let captureSession = self.captureSession else { throw CameraControllerError.captureSessionIsMissing }
            if let camera = self.camera {
                cameraInput = try AVCaptureDeviceInput(device: camera)
                if captureSession.canAddInput(cameraInput!){ captureSession.addInput(cameraInput!) }
            }
            else { throw CameraControllerError.noCamerasAvailable }
        }
        func configurePhotoOutput() throws {
            guard let captureSession = self.captureSession else { throw CameraControllerError.captureSessionIsMissing }
            
            
        }
    }
}
