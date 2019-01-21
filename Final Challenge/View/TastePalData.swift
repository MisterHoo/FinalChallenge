//
//  TastePalData.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 16/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation

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
    var tastePreference: [tasteInformation]!
    var foodAvoid: [String]!
    
}
