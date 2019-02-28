//
//  TastePalData.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 16/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import UIKit

struct TastePalData {
    static var user = userInformation()
    static var food: [foodInformation] = []
}

class tasteInformation {
    var type: String!
    var description: String!
    var percentage : Int!
}

class foodInformation {
    var rating: Int!
    var review: String!
    var image: String!
    var name: String!
    var location: String!
    var history: String!
}

class userInformation {
    var uid: String!
    var username: String!
    var email: String!
    var photoProfile: String!
    var tastePreference: [TastePreference]!
    var foodAvoid: [String]!
    
}


struct TastePalColor {
    static var charcoal = UIColor(red: 62/255, green: 60/255, blue: 73/255, alpha: 1)
    static var olive = UIColor(red: 149/255, green: 144/255, blue: 93/255, alpha: 1)
    static var darkWhite = UIColor(red: 235/255, green: 234/255, blue: 240/255, alpha: 1)
}

struct TastePalIcon{
    static var starGray = UIImage(named: "StarGray")
    static var starYellow = UIImage(named: "StarYellow")
    static var heartEmpty = UIImage(named: "Heart")
    static var heartFilled = UIImage(named: "HeartFilled")
    static var tick = UIImage(named: "Tick")
    static var editProfile = UIImage(named: "Edit Profile Image Placeholder")
    static var findOutFood = UIImage(named: "Find Out & Profile Food Image")
    static var historyImage = UIImage(named: "History Image Placeholder")
    static var profileImage = UIImage(named: "Profile Image Placeholder")
    static var resultHeaderImage = UIImage(named: "Result Image Placeholder")
    static var resultRecommendedImage = UIImage(named: "Result Recommended Image")
    static var reviewProfile = UIImage(named: "Review Profile Image Placeholder")
    
}

struct DummyFoodPreference{
    static var foodLike : [FoodLike] = [FoodLike(origin: "Indonesian", image: UIImage(named: "Indonesian")!, like: false, sweet: true, salty: false, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Japanese", image: UIImage(named: "Japanese")!, like: false, sweet: false, salty: true, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Italian", image: UIImage(named: "Italian")!, like: false, sweet: true, salty: false, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Indian", image: UIImage(named: "Indian")!, like: false, sweet: true, salty: false, savoury: true, sour: false, bitter: false, bland: false),
                                                    FoodLike(origin: "Middle-eastern", image: UIImage(named: "Middle-East")!, like: false, sweet: true, salty: false, savoury: true, sour: false, bitter: false, bland: false),
                                                    FoodLike(origin: "Thai", image: UIImage(named: "Thai")!, like: false, sweet: true, salty: true, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Chinese", image: UIImage(named: "Chinese")!, like: false, sweet: true, salty: true, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "French", image: UIImage(named: "French")!, like: false, sweet: true, salty: false, savoury: true, sour: true, bitter: true, bland: true),
                                                    FoodLike(origin: "Mexican", image: UIImage(named: "Mexican")!, like: false, sweet: true, salty: true, savoury: true, sour: false, bitter: false, bland: false),
                                                    FoodLike(origin: "Korean", image: UIImage(named: "Korean")!, like: false, sweet: true, salty: false, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Spanish", image: UIImage(named: "Spanish")!, like: false, sweet: true, salty: true, savoury: false, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Greek", image: UIImage(named: "Greek")!, like: false, sweet: false, salty: true, savoury: false, sour: true, bitter: false, bland: true),
                                                    FoodLike(origin: "Malay", image: UIImage(named: "Malay")!, like: false, sweet: false, salty: false, savoury: true, sour: true, bitter: false, bland: false),
                                                    FoodLike(origin: "Viet", image: UIImage(named: "Viet")!, like: false, sweet: true, salty: true, savoury: false, sour: true, bitter: true, bland: false),
                                                    FoodLike(origin: "Turkish", image: UIImage(named: "Turkish")!, like: false, sweet: true, salty: false, savoury: true, sour: true, bitter: false, bland: false)]
    
    static var tasteNotLike : [TasteTest] = [TasteTest(name: "Sweet", image: UIImage(named: "Sweet")!, check: false),
                                      TasteTest(name: "Salty", image: UIImage(named: "Salty")!, check: false),
                                      TasteTest(name: "Sour", image: UIImage(named: "Sour")!, check: false),
                                      TasteTest(name: "Savoury", image: UIImage(named: "Savoury")!, check: false),
                                      TasteTest(name: "Bitter", image: UIImage(named: "Bitter")!, check: false),
                                      TasteTest(name: "Bland", image: UIImage(named: "Bland")!, check: false)]
   
    static var tastePreference : [TastePreference] = []
    
}
