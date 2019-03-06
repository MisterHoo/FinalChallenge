//
//  TPReview.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 27/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import EasyMapping

class TPFavoriteListModel: NSObject, EKMappingProtocol{
    @objc dynamic var TPFavoriteList = [TPFavoriteModel]()
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.hasMany(TPFavoriteModel.self, forKeyPath: "content", forProperty: "TPFavoriteList")
        })
    }
}

class TPFavoriteModel : NSObject, EKMappingProtocol{
    @objc dynamic var review_id = 0
    @objc dynamic var food_id = 0
    @objc dynamic var uid = 0
    @objc dynamic var restaurant_id = 0
    @objc dynamic var food_name = ""
    @objc dynamic var restaurant_name = ""
    @objc dynamic var location_name = ""
    @objc dynamic var taste = ""
    @objc dynamic var rating = 0
    @objc dynamic var reviewDate = Date()
    @objc dynamic var favorite_food = false
    @objc dynamic var descript = ""
    @objc dynamic var food_image = ""
    
    convenience init(review_id : Int, descript : String, taste : String, rating : Int, food_image : String, favorite_food : Bool, food_id : Int, uid : Int, food_name : String, restaurant_id : Int, restaurant_name : String, location_name : String, reviewDate : Date) {
        self.init()
        self.review_id = review_id
        self.descript = descript
        self.taste = taste
        self.rating = rating
        self.food_image = food_image
        self.favorite_food = favorite_food
        self.food_id = food_id
        self.uid = uid
        self.food_name = food_name
        self.restaurant_id = restaurant_id
        self.restaurant_name = restaurant_name
        self.location_name = location_name
        self.reviewDate = reviewDate
    }
    
    /*
     "location_name" : "",
     "reviewDate" : "2019-03-05 11:25:35",
     "restaurant_name" : "Sate Khas Senayan",
     */
    
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
                        "restaurant_id",
                        "location_name",
                        "restaurant_name"
                    ])
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                mapping.mapKeyPath("reviewDate", toProperty: "reviewDate", with: dateFormatter)
        })
    }
}
