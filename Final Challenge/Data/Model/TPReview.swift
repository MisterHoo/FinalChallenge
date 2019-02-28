//
//  TPReview.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 27/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import EasyMapping

class TPReviewListModel: NSObject, EKMappingProtocol{
    @objc dynamic var TPReviewList = [TPReviewModel]()
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.hasMany(TPReviewModel.self, forKeyPath: "content", forProperty: "TPReviewList")
        })
    }
}

class TPReviewModel : NSObject, EKMappingProtocol{
    @objc dynamic var restaurant_id = 0
    @objc dynamic var desc = ""
    @objc dynamic var rating = 0
    @objc dynamic var taste = ""
    @objc dynamic var review_id = 0
    @objc dynamic var food_name = ""
    @objc dynamic var food_image = ""
    @objc dynamic var favorite_food = ""
    @objc dynamic var uid = 0
    @objc dynamic var food_id = 0
    
    
    convenience init(review_id : Int, description : String, taste : String, rating : Int, food_image : String, favorite_food : String, food_id : Int, uid : Int, food_name : String, restaurant_id : Int) {
        self.init()
        self.review_id = review_id
        self.desc = description
        self.taste = taste
        self.rating = rating
        self.food_image = food_image
        self.favorite_food = favorite_food
        self.food_id = food_id
        self.uid = uid
        self.food_name = food_name
        self.restaurant_id = restaurant_id
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapProperties(from:
                    [
                        "review_id",
                        "description",
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
