//
//   CIImagetoCGImage.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 18/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

extension CIImage{
    func convertCIImageToCGImage() -> CGImage! {
        let context = CIContext(options: nil)
        if context != nil {
            return context.createCGImage(self, from: self.extent)
        }
        return nil
    }
}
