//
//  NewGuestModel.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 04/03/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import EasyMapping

class TPNewGuestModel : NSObject, EKMappingProtocol{
    @objc dynamic var message = ""
    @objc dynamic var uid = 0
    @objc dynamic var taste_id = 0
    
    convenience init(message : String, uid : Int, taste_id : Int) {
        self.init()
//        self.message = message
//        self.uid = uid
//        self.taste_id = taste_id
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapKeyPath("message", toProperty: "message")
                mapping.mapKeyPath("uid", toProperty: "uid")
                mapping.mapKeyPath("taste_id", toProperty: "taste_id")
        })
    }
}
