//
//  CIImageExtension.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 15/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//
import UIKit
extension CIImage {
    func toUIImage() -> UIImage? {
        let context: CIContext = CIContext.init(options: nil)
        
        if let cgImage: CGImage = context.createCGImage(self, from: self.extent) {
            return UIImage(cgImage: cgImage)
        } else {
            return nil
        }
    }
}
