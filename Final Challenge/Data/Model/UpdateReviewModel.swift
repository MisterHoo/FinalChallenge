//
//  UpdateReviewModel.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 04/03/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import EasyMapping

class TPUpdateReviewModel : NSObject, EKMappingProtocol{
    @objc dynamic var message = ""
    
    convenience init(message : String) {
        self.init()
        self.message = message
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapProperties(from:
                    [
                        "message"
                    ])
        })
    }
}
