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
    
    static func GET_TPReview(
        endPoint:String,
        successCompletion:@escaping (TPReviewListModel, String) -> Void,
        failCompletion:@escaping (String) -> Void){
        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
        let url = TastePalUrl.GET_REVIEW
        print(url)
        TastePalAPI.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
            let json = JSON(jsonData)
            print(json)
            print(json["test"])
            if(json["test"].stringValue == "nyobain"){
                print(json["semoga bisa"].dictionary as Any)
                let content = EKMapper.object(
                    fromExternalRepresentation: json["result"].dictionaryObject!,
                    with: TPReviewModel.objectMapping()
                )
                successCompletion(content as! TPReviewListModel,/*json["message"].stringValue*/"Success")
            }else{
                failCompletion(json["message"].stringValue)
            }
        })
    }
//
//    static func POST_SIGNIN(
//        email:String,
//        password:String,
//        successCompletion:@escaping (UserModel, String, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        let parameters:Parameters = ["email":email,
//                                     "password":password]
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.POST(url: MAEUrl.LOGIN, parameter: parameters, /*header: headers*/ showHUD: true,completion:{jsonData in
//            let json = JSON(jsonData)
//            print("kampret login : \(json)")
//
//            if(json["status"].boolValue){
//                if(json["message"].stringValue != "Required parameters doesn't provide"){
//                    let user = EKMapper.object(
//                        fromExternalRepresentation: json["result"].dictionaryObject!,
//                        with: UserModel.objectMapping()
//                    )
//                    successCompletion(user as! UserModel,json["message"].stringValue,json["result"]["token"].stringValue)
//                } else {
//                    //
//                    failCompletion(json["message"].stringValue)
//                }
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func POST_SIGNOUT(
//        userId:String,
//        tokenAcc:String,
//        tokenRef:String,
//        successCompletion:@escaping (Bool) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        let parameters:Parameters = ["uid":userId,
//                                     "token_access":tokenAcc,
//                                     "token_refresh":tokenRef]
//        MAEApi.POST(url: MAEUrl.LOGOUT, parameter: parameters, showHUD: true,completion:{jsonData in
//            let json = JSON(jsonData)
//            print(json)
//            if(json["status"].boolValue){
//                successCompletion(json["status"].boolValue)
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func POST_REGISTER(
//        email:String,
//        fullname:String,
//        password:String,
//        password2:String,
//        successCompletion:@escaping (RegisterModel, String, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        let parameters:Parameters = ["email":email,
//                                     "fullname":fullname,
//                                     "password":password,
//                                     "password2":password2]
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.POST(url: MAEUrl.API_REGISTER, /*header: headers,*/ parameter: parameters, showHUD: true,completion:{jsonData in
//            let json = JSON(jsonData)
//            print(json)
//
//            if(json["status"].boolValue){
//                let user = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: RegisterModel.objectMapping()
//                )
//                successCompletion(user as! RegisterModel,json["message"].stringValue,json["result"]["token"].stringValue)
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_PROFILE(
//        userId:String,
//        successCompletion:@escaping (ProfileListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        let token = UserDefaults.standard.string(forKey: "TokenAccess")
//        let headers:HTTPHeaders = ["token_access":token!]
//        let parameters:Parameters = ["ev":"1",
//                                     "userid":userId]
//        MAEApi.POST_WITH_HEADER(url: MAEUrl.MY_PROFILE, parameter: parameters, header: headers, showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            print("my profile: \(json)")
//            if(json["status"].boolValue){
//                print("asdasd : \(json["result"].dictionary as Any)")
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: ProfileListModel.objectMapping()
//                )
//                successCompletion(content as! ProfileListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//        /*
//         MAEApi.GET(url: MAEUrl.MY_PROFILE + userId, header: headers, showHUD: true, completion: {jsonData in
//         let json = JSON(jsonData)
//         if(json["status"].boolValue){
//         print(json["result"].dictionary as Any)
//         let content = EKMapper.object(
//         fromExternalRepresentation: json["result"].dictionaryObject!,
//         with: ProfileListModel.objectMapping()
//         )
//         successCompletion(content as! ProfileListModel,/*json["message"].stringValue*/"Success")
//         }else{
//         failCompletion(json["message"].stringValue)
//         }
//         })
//         */
//    }
//
//    // MARK: - Static - GET
//
//    static func GET_ABOUTUS(
//        endPoint:String,
//        successCompletion:@escaping (AboutModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.ABOUT, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            print(json)
//
//            if(json["status"].boolValue){
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"]["content"].dictionaryObject!,
//                    with: AboutModel.objectMapping()
//                )
//                successCompletion(content as! AboutModel,json["message"].stringValue)
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_NOTIFICATION_LIST(
//        endPoint:String,
//        successCompletion:@escaping (NotificationListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        print("userid berapa sih: \(endPoint)")
//        MAEApi.GET(url: MAEUrl.NOTIFICATION_LIST + endPoint, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print("Notif List")
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: NotificationListModel.objectMapping()
//                )
//                successCompletion(content as! NotificationListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_NOTIFICATION_DETAIL(
//        userId : String,
//        notId : String,
//        successCompletion:@escaping (NotificationDetailModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.GET_NOTIFICATION_DETAIL(userId: userId, notId: notId), /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            print(json)
//            if(json["status"].boolValue){
//                print("Notif Detail")
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: NotificationDetailModel.objectMapping()
//                )
//                successCompletion(content as! NotificationDetailModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_TESTIMONIALS(
//        endPoint:String,
//        successCompletion:@escaping (TestimonialListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.TESTIMONIALS, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: TestimonialListModel.objectMapping()
//                )
//                successCompletion(content as! TestimonialListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_SCHEDULE(
//        endPoint:String,
//        successCompletion:@escaping (ScheduleListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.SCHEDULE, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//
//            if(json["status"].boolValue){
//                //                print(json["result"])
//                //                print(json["result"][])
//                print(json["result"].dictionary as Any)
//
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: ScheduleListModel.objectMapping()
//                )
//                successCompletion(content as! ScheduleListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_VENUE(
//        endPoint:String,
//        successCompletion:@escaping (VenueListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.VENUE, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: VenueListModel.objectMapping()
//                )
//                successCompletion(content as! VenueListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_ALBUM(
//        endPoint:String,
//        successCompletion:@escaping (AlbumListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.ALBUM, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: AlbumListModel.objectMapping()
//                )
//                successCompletion(content as! AlbumListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_PHOTO_LIST(
//        endPoint:String,
//        successCompletion:@escaping (PhotoCollListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.PHOTOLIST + endPoint, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: PhotoCollListModel.objectMapping()
//                )
//                successCompletion(content as! PhotoCollListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_PHOTO_DETAIL(
//        albumId:String, photoId : String,
//        successCompletion:@escaping (PhotoDetailListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//
//        MAEApi.GET(url: MAEUrl.GET_PHOTODETAIL(albumId: albumId, photoId: photoId), /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: PhotoDetailListModel.objectMapping()
//                )
//                successCompletion(content as! PhotoDetailListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_TIPSTRICK(
//        endPoint:String,
//        successCompletion:@escaping (TipsTrickListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        MAEApi.GET(url: MAEUrl.TIPSTRICK, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: TipsTrickListModel.objectMapping()
//                )
//                successCompletion(content as! TipsTrickListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
//
//    static func GET_TIPSTRICKDETAIL(
//        endPoint:String,
//        successCompletion:@escaping (TipsTrickDetailListModel, String) -> Void,
//        failCompletion:@escaping (String) -> Void){
//        //        let headers:HTTPHeaders = ["X-Api-Key":"883F72561AFD4FAEB3A20E814DE4881E"]
//        let url = MAEUrl.TIPSTRICKDETAIL+endPoint
//        print(url)
//        MAEApi.GET(url: url, /*header: headers,*/ showHUD: true, completion: {jsonData in
//            let json = JSON(jsonData)
//            if(json["status"].boolValue){
//                print(json["result"].dictionary as Any)
//                let content = EKMapper.object(
//                    fromExternalRepresentation: json["result"].dictionaryObject!,
//                    with: TipsTrickDetailListModel.objectMapping()
//                )
//                successCompletion(content as! TipsTrickDetailListModel,/*json["message"].stringValue*/"Success")
//            }else{
//                failCompletion(json["message"].stringValue)
//            }
//        })
//    }
    
    
}
