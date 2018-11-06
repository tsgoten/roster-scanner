//
//  BarcodeScanner.swift
//  Roster Scanner
//
//  Created by Tarang Srivastava on 10/22/18.
//  Copyright © 2018 Tarang Srivastava. All rights reserved.
//

import Vision

private func scanImage(cgImage: CGImage) {
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [.properties : ""])

}
