//
//  ViewController.swift
//  Roster Scanner
//
//  Created by Tarang Srivastava on 10/8/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import UIKit
import Vision
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var capturePreviewView: UIView!
    let cameraController = CameraController()

}

extension ViewController {
    
    override func viewDidLoad() {
        func configureCameraController() {
            cameraController.prepare{(error) in
                if let error = error {
                    print(error)
                }
                try? self.cameraController.displayPreview(on: self.capturePreviewView)
                
            }
        }
        configureCameraController()
        cameraController.scanImage()
    }
}

