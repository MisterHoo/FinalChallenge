//
//  ResultModel.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 04/03/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import EasyMapping

class TPResultListModel: NSObject, EKMappingProtocol{
    @objc dynamic var TPResultList = [TPResultModel]()
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.hasMany(TPReviewModel.self, forKeyPath: "content", forProperty: "TPResultList")
        })
    }
}

class TPResultModel : NSObject, EKMappingProtocol{
    @objc dynamic var food_name = ""
    @objc dynamic var food_image = ""
    @objc dynamic var restaurant_name = ""
    @objc dynamic var restaurant_location = ""
    @objc dynamic var taste = ""
    @objc dynamic var profile_image = ""
    @objc dynamic var username = ""
    @objc dynamic var rating = 0
    @objc dynamic var descript = ""
    
    
    convenience init(food_name : String, food_image : String, restaurant_name : String, restaurant_location : String, taste : String, profile_image : String, username : String, rating : Int, descript : String) {
        self.init()
        self.food_name = food_name
        self.food_image = food_image
        self.restaurant_name = restaurant_name
        self.restaurant_location = restaurant_location
        self.taste = taste
        self.profile_image = profile_image
        self.username = username
        self.rating = rating
        self.descript = descript
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapProperties(from:
                    [
                        "review_id",
                        "descript",
                        "taste",
                        "rating",
                        "food_image",
                        "favorite_food",
                        "food_id",
                        "uid",
                        "food_name",
                        "restaurant_id"
                    ])
        })
    }
}
