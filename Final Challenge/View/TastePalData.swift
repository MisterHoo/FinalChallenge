//
//  TastePalData.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 16/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation

struct TastePalData {
    static var user: userInformation!
    static var food: [foodInformation]!
}

@objc class tasteInformation : NSObject {
    @objc dynamic var type: String!
    @objc dynamic var desc: String!
    @objc dynamic var percentage : Float = 0.0
}

@objc class foodInformation : NSObject{
    @objc dynamic var rating = 0
    @objc dynamic var review: String!
    @objc dynamic var image: String!
    @objc dynamic var name: String!
    @objc dynamic var location: String!
    @objc dynamic var history: String!
}

@objc class userInformation : NSObject {
    @objc dynamic var uid: String!
    @objc dynamic var username: String!
    @objc dynamic var email: String!
    @objc dynamic var photoProfile: String!
    @objc dynamic var tastePreference : [tasteInformation] = []
    @objc dynamic var foodAvoid: [String]!
    
}
