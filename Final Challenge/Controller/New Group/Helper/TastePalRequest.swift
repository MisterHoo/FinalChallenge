//
//  TastePalRequest.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 18/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import EasyMapping
import SVProgressHUD

class TastePalRequest: NSObject {
    
    static func GET_TPReview(uid : Int,
        endPoint:String,
        successCompletion:@escaping (TPReviewListModel, String) -> Void,
        failCompletion:@escaping (String) -> Void){
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        let url = TastePalUrl.GET_REVIEW(uid: uid)
        print(url)
        TastePalAPI.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
            let json = JSON(jsonData)
            print(json)
//            print(json["test"])
            if(json["status"].boolValue){
//                print(json["result"])
//                print(json["result"].dictionaryObject!)
                
//                print(json["result"].dictionary as Any)
                
                let content = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPReviewListModel.objectMapping()
                )
                successCompletion(content as! TPReviewListModel,/*json["message"].stringValue*/"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    static func GET_TPFavoriteFood(uid : Int,
                             endPoint:String,
                             successCompletion:@escaping (TPFavoriteListModel, String) -> Void,
                             failCompletion:@escaping (String) -> Void){
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        let url = TastePalUrl.GET_FAVORITEFOOD(uid: uid)
        print(url)
        TastePalAPI.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
            let json = JSON(jsonData)
            print(json)
            //            print(json["test"])
            if(json["status"].boolValue){
                //                print(json["result"])
                //                print(json["result"].dictionaryObject!)
                
                //                print(json["result"].dictionary as Any)
                
                let content = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPFavoriteListModel.objectMapping()
                )
                successCompletion(content as! TPFavoriteListModel,/*json["message"].stringValue*/"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    static func GET_TPResult(uid : Int, foodId : Int, restoId : Int,
                             endPoint:String,
                             successCompletion:@escaping (TPResultListModel, String) -> Void,
                             failCompletion:@escaping (String) -> Void){
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        let url = TastePalUrl.GET_RESULT(food_id: foodId, resto_id: restoId, uid: uid)
        TastePalAPI.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
            let json = JSON(jsonData)
            print(json)
    
            if(json["status"].boolValue){
//                print(json["result"])
//                print(json["result"].dictionaryObject!) 
//                print(json["result"].dictionary as Any)
                
                let content = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPResultListModel.objectMapping()
                )
                successCompletion(content as! TPResultListModel,/*json["message"].stringValue*/"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    static func GET_TPSuggestedFood(lng : Float, lat : Float,
                             endPoint:String,
                             successCompletion:@escaping (TPSuggestedFoodListModel, String) -> Void,
                             failCompletion:@escaping (String) -> Void){
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        let url = TastePalUrl.GET_SUGGESTEDFOOD(lng: lng, lat: lat)
        print(url)
        TastePalAPI.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
            let json = JSON(jsonData)
            //            print(json["test"])
            if(json["status"].boolValue){
                //                print(json["result"])
                //                print(json["result"].dictionaryObject!)
                
                //                print(json["result"].dictionary as Any)
                
                let content = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPSuggestedFoodListModel.objectMapping()
                )
                successCompletion(content as! TPSuggestedFoodListModel,/*json["message"].stringValue*/"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    static func GET_TPTastePreference(uid : Int,
                             endPoint:String,
                             successCompletion:@escaping (TPTastePreferencesModel, String) -> Void,
                             failCompletion:@escaping (String) -> Void){
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        let url = TastePalUrl.GET_TASTEPREFERENCE(uid: uid)
        print(url)
        
        TastePalAPI.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
            let json = JSON(jsonData)
            print(json)
            
            if(json["status"].boolValue){
                //                print(json["result"])
                //                print(json["result"].dictionaryObject!)
                
                //                print(json["result"].dictionary as Any)
                
                let content = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPTastePreferencesModel.objectMapping()
                )
                successCompletion(content as! TPTastePreferencesModel,/*json["message"].stringValue*/"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    static func POST_NEWGUEST(
        registered : String,
        first_taste : String,
        first_value : Float,
        second_taste : String,
        second_value : Float,
        third_taste : String,
        third_value : Float,
        fourth_taste : String,
        fourth_value : Float,
        fifth_taste : String,
        fifth_value : Float,
        sixth_taste : String,
        sixth_value : Float,
        successCompletion:@escaping (TPNewGuestModel, String) -> Void,
        failCompletion:@escaping (String) -> Void){
        let parameters:Parameters = ["registered" : registered,
                                     "first_taste" : first_taste,
                                     "first_value" : first_value,
                                     "second_taste" : second_taste,
                                     "second_value" : second_value,
                                     "third_taste" : third_taste,
                                     "third_value" : third_value,
                                     "fourth_taste" : fourth_taste,
                                     "fourth_value" : fourth_value,
                                     "fifth_taste" : fifth_taste,
                                     "fifth_value" : fifth_value,
                                     "sixth_taste" : sixth_taste,
                                     "sixth_value" : sixth_value]
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        
        TastePalAPI.POST(url: TastePalUrl.POST_NEW_GUEST, parameter: parameters, /*header: headers*/ showHUD: true,completion:{jsonData in
            let json = JSON(jsonData)
            print(json)
            
            if(json["status"].boolValue){
                
                let user = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPNewGuestModel.objectMapping()
                )
                successCompletion(user as! TPNewGuestModel,"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    static func POST_REVIEW(
        desc:String,
        taste:String,
        rating:Int,
        food_image:String,
        favorite_food:Bool,
        uid:Int,
        lng:Float,
        lat:Float,
        food_name:String,
        resto_name:String,
        resto_location:String,
        successCompletion:@escaping (TPPostReviewModel, String) -> Void,
        
        failCompletion:@escaping (String) -> Void){
        
//        let characterset = CharacterSet(charactersIn: "-0123456789")
//        let lngString : String = String(lng).addingPercentEncoding(withAllowedCharacters: characterset)!
//
//        let latString : String = String(lat).addingPercentEncoding(withAllowedCharacters: characterset)!
//
//
//
//        print(desc)
//        print(taste)
//        print(rating)
//        print(favorite_food)
//        print(uid)
//        print(lngString)
//        print(latString)
//        print(food_name)
//        print(resto_name)
//        print(resto_location)
        
        let parameters:Parameters = ["descript":desc,
                                     "taste":taste,
                                     "rating":rating,
                                     "food_image":food_image,
                                     "favorite_food":favorite_food,
                                     "uid":uid,
                                     "lng":lng,
                                     "lat":lat,
                                     "food_name":food_name,
                                     "restaurant_name":resto_name,
                                     "restaurant_location":resto_location]
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        print(TastePalUrl.POST_REVIEW)
        TastePalAPI.POST(url: TastePalUrl.POST_REVIEW, /*header: headers,*/ parameter: parameters, showHUD: true,completion:{jsonData in
            let json = JSON(jsonData)
            print(json)
            
            if(json["status"].boolValue){
                let user = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPPostReviewModel.objectMapping()
                )
                successCompletion(user as! TPPostReviewModel,"Success")
            }else{
                failCompletion("Failed")
            }
        })
    }
    
    static func POST_ATEFOOD(
        food_id : Int, uid : Int,
        successCompletion:@escaping (TPAteFoodModel, String) -> Void,
        
        failCompletion:@escaping (String) -> Void){
        let parameters:Parameters = ["food_id" : food_id,
                                     "uid" : uid]
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        TastePalAPI.POST(url: TastePalUrl.POST_ATEFOOD, /*header: headers,*/ parameter: parameters, showHUD: true,completion:{jsonData in
            let json = JSON(jsonData)
            print(json)
            
            if(json["status"].boolValue){
                let user = EKMapper.object(
                    fromExternalRepresentation: json["message"].dictionaryObject!,
                    with: TPAteFoodModel.objectMapping()
                )
                successCompletion(user as! TPAteFoodModel,json["message"].stringValue)
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
    
    /*$review_id = $request->getParam('review_id');
    $descript = $request->getParam('descript');
    $taste = $request->getParam('taste');
    $rating = $request->getParam('rating');
    $food_image = $request->getParam('food_image');
    $favorite_food = $request->getParam('favorite_food') == 'true' ? 1 : 0;*/
    
    static func POST_UPDATEREVIEW(
        review_id : Int,
        descript : String,
        taste : String,
        rating : Int,
        food_image : String,
        food_image_name : String,
        food_paramter : String,
        favorite_food : String,
        successCompletion:@escaping (TPUpdateReviewModel, String) -> Void,
        
        failCompletion:@escaping (String) -> Void){
        let parameters:Parameters = ["review_id" : review_id,
                                     "descript" : descript,
                                     "taste" : taste,
                                     "rating" : rating,
                                     "food_image" : food_image,
                                     "favorite_food" : favorite_food]
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        TastePalAPI.POST(url: TastePalUrl.UPDATE_REVIEW, parameter: parameters, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print(json)
            
            if(json["status"].boolValue){
                let user = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPUpdateReviewModel.objectMapping()
                )
                successCompletion(user as! TPUpdateReviewModel,"Success")
            }else{
                failCompletion("Failed")
            }
        }
    )
    }
}
