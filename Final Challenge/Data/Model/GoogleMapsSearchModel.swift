//
//  GoogleMapsSearchModel.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 04/03/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import Foundation
import EasyMapping

class GoogleMapsSearchListModel: NSObject, EKMappingProtocol{
    @objc dynamic var GoogleMapsSearchListModel = [GoogleMapsSearchModel]()
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.hasMany(GoogleMapsSearchModel.self, forKeyPath: "results", forProperty: "GoogleMapsSearchListModel")
        })
    }
}

class GoogleMapsSearchModel : NSObject, EKMappingProtocol{
    @objc dynamic var lat = 0.0
    @objc dynamic var lng = 0.0
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var place_id = ""
    @objc dynamic var compound_code = ""
    
    
    convenience init(lat : Double, lng : Double, id : String, name : String, place_id : String, compound_code : String) {
        self.init()
        self.lat = lat
        self.lng = lng
        self.id = id
        self.name = name
        self.place_id = place_id
        self.compound_code = compound_code
    }
    
    static func objectMapping() -> EKObjectMapping {
        return EKObjectMapping(
            for: self,
            with: {(mapping) in
                mapping.mapProperties(from:
                    [
                        "lat",
                        "lng",
                        "id",
                        "name",
                        "place_id",
                        "compound_code",
                    ])
        })
    }
}


/*
 geometry
    location
        lat    -6.2218224
        lng    106.63097
 id    "cae6ef3e00a5139d26535ee0a410ced87c0ef4f5"
 name    "Istana Nelayan Resto & Cafe"
 place_id    "ChIJV2e3CVX5aS4RDxct-B9qRoo"
 plus_code
    compound_code    "QJHJ+79 Tangerang, Kota Tangerang, Banten, Indonesia"
    global_code    "6P58QJHJ+79"
 */
