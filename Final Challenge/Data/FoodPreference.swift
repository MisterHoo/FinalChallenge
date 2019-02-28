//
//  Taste.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import UIKit

class FoodLike : NSObject{
    var origin : String
//    var image : String
    var image : UIImage
    var like : Bool
    var sweet : Bool
    var salty : Bool
    var savoury : Bool
    var sour : Bool
    var bitter : Bool
    var bland : Bool
    
    init(origin : String, image : UIImage, like : Bool, sweet : Bool, salty : Bool, savoury : Bool, sour : Bool, bitter : Bool, bland : Bool) {
        self.origin = origin
        self.image = image
        self.like = like
        self.sweet = sweet
        self.salty = salty
        self.savoury = savoury
        self.sour = sour
        self.bitter = bitter
        self.bland = bland
    }
}

class TasteTest : NSObject{
    var name : String
    var image : UIImage
    var check : Bool
    
    init(name : String, image : UIImage, check : Bool){
        self.name = name
        self.image = image
        self.check = check
        
    }
}
