//
//  TastePreferenceModel.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 04/03/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import EasyMapping

class TPTastePreferencesListModel: NSObject, EKMappingProtocol{
    @objc dynamic var TPTastePreferenceList = [TPTastePreferencesModel]()
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.hasMany(TPTastePreferencesModel.self, forKeyPath: "content", forProperty: "TPTastePreferenceList")
        })
    }
}

class TPTastePreferencesModel : NSObject, EKMappingProtocol{
    @objc dynamic var taste_id = 0
    @objc dynamic var first_taste = ""
    @objc dynamic var first_value : Float = 0.0
    @objc dynamic var second_taste = ""
    @objc dynamic var second_value : Float  = 0.0
    @objc dynamic var third_taste = ""
    @objc dynamic var third_value : Float = 0.0
    @objc dynamic var fourth_taste = ""
    @objc dynamic var fourth_value : Float = 0.0
    @objc dynamic var fifth_taste = ""
    @objc dynamic var fifth_value : Float = 0.0
    @objc dynamic var sixth_taste = ""
    @objc dynamic var sixth_value : Float = 0.0
    
    convenience init(taste_id : Int, first_taste : String, first_value : Float, second_taste : String, second_value : Float, third_taste : String, third_value : Float, fourth_taste : String, fourth_value : Float, fifth_taste : String, fifth_value : Float, sixth_taste : String, sixth_value : Float) {
        self.init()
//        self.taste_id = taste_id
//        self.first_taste = first_taste
//        self.first_value = first_value
//        self.second_taste = second_taste
//        self.second_value = second_value
//        self.third_taste = third_taste
//        self.third_value = third_value
//        self.fourth_taste = fourth_taste
//        self.fourth_value = fourth_value
//        self.fifth_taste = fifth_taste
//        self.first_value = fifth_value
//        self.sixth_taste = sixth_taste
//        self.sixth_value = sixth_value
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapKeyPath("taste_id", toProperty: "taste_id")
                mapping.mapKeyPath("first_taste", toProperty: "first_taste")
                mapping.mapKeyPath("first_value", toProperty: "first_value")
                mapping.mapKeyPath("second_taste", toProperty: "second_taste")
                mapping.mapKeyPath("second_value", toProperty: "second_value")
                mapping.mapKeyPath("third_taste", toProperty: "third_taste")
                mapping.mapKeyPath("third_value", toProperty: "third_value")
                mapping.mapKeyPath("fourth_taste", toProperty: "fourth_taste")
                mapping.mapKeyPath("fourth_value", toProperty: "fourth_value")
                mapping.mapKeyPath("fifth_taste", toProperty: "fifth_taste")
                mapping.mapKeyPath("fifth_value", toProperty: "fifth_value")
                mapping.mapKeyPath("sixth_taste", toProperty: "sixth_taste")
                mapping.mapKeyPath("sixth_value", toProperty: "sixth_value")
        })
    }
}
