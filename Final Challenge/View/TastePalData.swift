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
}
