//
//  BasicTaste.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class BasicTaste : NSObject{
    var name : String?
    var color : UIColor?
    
    init(name : String, color : UIColor) {
        self.name = name
        self.color = color
    }
}

struct BasicTasteData{
    static let basicTaste : [BasicTaste] =
        [BasicTaste(name: "Sweet", color: UIColor(red: 182/255, green: 94/255, blue: 200/255, alpha: 1)),
         BasicTaste(name: "Salty", color: UIColor(red: 66/255, green: 181/255, blue: 182/255, alpha: 1)),
         BasicTaste(name: "Sour", color: UIColor(red: 227/255, green: 216/255, blue: 80/255, alpha: 1)),
         BasicTaste(name: "Bitter", color: UIColor(red: 139/255, green: 87/255, blue: 42/255, alpha: 1)),
         BasicTaste(name: "Bland", color: UIColor(red: 139/255, green: 144/255, blue: 124/255, alpha: 1)),
         BasicTaste(name: "Savoury", color: UIColor(red: 209/255, green: 155/255, blue: 66/255, alpha: 1))]
    
    public func getTasteInfo(taste : Taste) -> BasicTaste?{
        if taste == Taste.sweet{
            return BasicTasteData.basicTaste[0]
        }else if taste == Taste.salty{
            return BasicTasteData.basicTaste[1]
        }else if taste == Taste.sour{
            return BasicTasteData.basicTaste[2]
        }else if taste == Taste.bitter{
            return BasicTasteData.basicTaste[3]
        }else if taste == Taste.bland{
            return BasicTasteData.basicTaste[4]
        }else if taste == Taste.savoury{
            return BasicTasteData.basicTaste[5]
        }
        return nil
    }
}

