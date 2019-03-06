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
                mapping.hasMany(TPResultModel.self, forKeyPath: "content", forProperty: "TPResultList")
        })
    }
}

class TPResultModel : NSObject, EKMappingProtocol{
    @objc dynamic var food_name = ""
    @objc dynamic var food_image = ""
    @objc dynamic var restaurant_name = ""
    @objc dynamic var location_name = ""
    @objc dynamic var taste = ""
    @objc dynamic var profile_image = ""
    @objc dynamic var name = ""
    @objc dynamic var rating = 0
    @objc dynamic var descript = ""
    
    convenience init(food_name : String, food_image : String, restaurant_name : String, location_name : String, taste : String, profile_image : String, name : String, rating : Int, descript : String) {
        self.init()
        self.food_name = food_name
        self.food_image = food_image
        self.restaurant_name = restaurant_name
        self.location_name = location_name
        self.taste = taste
        self.profile_image = profile_image
        self.name = name
        self.rating = rating
        self.descript = descript
    }
    
    /*
     "name" : "hoo",
     "food_name" : "Sate Kulit Kodok",
     "restaurant_name" : "Sate Khas Senayan",
     "food_image" : "no",
     "rating" : "4",
     "descript" : "pahit nya serasa ditinggalin dia :(",
     "profile_image" : null,
     "location_name" : "",
     "taste" : "bitter"*/
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapProperties(from:
                    [
                        "name",
                        "food_name",
                        "restaurant_name",
                        "food_image",
                        "rating",
                        "descript",
                        "profile_image",
                        "location_name",
                        "taste"
                    ])
        })
    }
}
