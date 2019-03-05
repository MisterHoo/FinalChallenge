//
//  SuggestedFood.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 04/03/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import EasyMapping

class TPSuggestedFoodListModel: NSObject, EKMappingProtocol{
    @objc dynamic var TPSuggestedFoodList = [TPSuggestedFoodModel]()
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.hasMany(TPSuggestedFoodModel.self, forKeyPath: "content", forProperty: "TPSuggestedFoodList")
        })
    }
}

class TPSuggestedFoodModel : NSObject, EKMappingProtocol{
    @objc dynamic var restaurant_id = 0
    @objc dynamic var food_id = 0
    @objc dynamic var food_name = ""
    
    convenience init(restaurant_id : Int, food_id : Int, food_name : String) {
        self.init()
        self.food_id = food_id
        self.food_name = food_name
        self.restaurant_id = restaurant_id
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapProperties(from:
                    [
                        "food_id",
                        "food_name",
                        "restaurant_id"
                    ])
        })
    }
}

