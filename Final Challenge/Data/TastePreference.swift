//
//  TastePreference.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation

class TastePreference : NSObject {
    let tasteData : BasicTaste?
    var value : Float?
    let type : Taste?
    
    
    init(type : Taste, value: Float){
        self.type = type
        self.value = value
        self.tasteData = BasicTasteData().getTasteInfo(taste: type)
    }
    
    func setValue(value : Float){
        self.value = value
    }
}

enum Taste : String{
    case sweet = "Sweet"
    case salty = "Salty"
    case sour = "Sour"
    case bitter = "Bitter"
    case bland = "Bland"
    case savoury = "Savoury"
}
