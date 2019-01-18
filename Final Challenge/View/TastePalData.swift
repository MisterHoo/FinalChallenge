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

class tasteInformation {
    static var type: String!
    static var description: String!
    static var percentage : Int!
}

class foodInformation {
    static var rating: Int!
    static var review: String!
    static var image: String!
    static var name: String!
    static var location: String!
    static var history: String!
}

class userInformation {
    static var uid: String!
    static var username: String!
    static var email: String!
    static var photoProfile: String!
    static var tastePreference: [tasteInformation]!
    static var foodAvoid: [String]!
    
}
