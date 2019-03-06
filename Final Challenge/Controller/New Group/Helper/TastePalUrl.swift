//
//  TastePalUrl.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 18/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class TastePalUrl: NSObject {
    static let MAIN = "http://178.128.88.131:8080/tastepal/"
//    static let IMAGE_PARENT_CATEGORY = MAIN + "parent_category_images/"
//    static let IMAGE_CHILD_CATEGORY = MAIN + "child_category_images/"
//    static let emailTest = "testing@gmail.com"
//    static let passTest = "testing"
//
//    /* API */
    static let API_GET = MAIN + "get/"
    static let API_POST = MAIN + "post/"
    static let API_UPDATE = MAIN + "update/"
    static let POST_REVIEW = API_POST + "review" //sudah
    static let POST_NEW_GUEST = API_POST + "newGuest" // sudah
    static let POST_USER = API_POST + "user" 
    static let POST_ATEFOOD = API_POST + "ateFood" // sudah
    static let UPDATE_REVIEW = API_UPDATE + "review"
    
    static func GET_RESULT(food_id : Int, resto_id : Int, uid : Int) -> String{ //sudah
        let url : String = API_GET + "result/" + "restoId=" + String(resto_id) + "/foodId=" + String(food_id) + "/" + String(uid)
        
        return url
    }
    
    static func GET_REVIEW(uid : Int) -> String{ // sudah
        let url : String = API_GET + "review/" + String(uid)
        return url
    }
    
    static func GET_TASTEPREFERENCE(uid : Int) -> String{
        let url : String = API_GET + "tastepreference/" + String(uid)
        return url
    }
    
    static func GET_SUGGESTEDFOOD(lng : Float, lat : Float) -> String{
        let characterset = CharacterSet(charactersIn: "-0123456789")
        let lngString : String = String(lng).addingPercentEncoding(withAllowedCharacters: characterset)!
        
        let latString : String = String(lat).addingPercentEncoding(withAllowedCharacters: characterset)!
        
        let url : String = API_GET + "suggestedFood/" + lngString + "/" + latString
        return url
    }
    
    static func GET_FAVORITEFOOD(uid : Int) -> String{
        let url : String = API_GET + "favoriteFood/" + String(uid)
        return url
    }
    
    
    
//    static let LOGIN = API_POST + "login" // [POST] : {email, password}
//    static let LOGOUT = API_POST + "logout" // [POST] : {uid, token_access, token_refresh}
//    static let MY_PROFILE = API_POST + "my_profile" //?ev=1&userid=" // [GET] : {ev, userid}
//    static let ABOUT = API_GET + "about?ev=1" // [GET] : {ev}
//    static let NOTIFICATION_LIST = API_GET + "notification?ev=1&userid=" // [GET] : {ev, userid}
//    //    static let NOTIFICATION_DETAIL = API_GET + "notification_read?ev=1&userid=1000&notid=" // [GET] : {ev, userid, idnot}
//    static let TESTIMONIALS = API_GET + "testi?ev=1" // [GET] : {ev}
//    static let SCHEDULE = API_GET + "jadwal?ev=1" // [GET] : {ev}
//    static let VENUE = API_GET + "venue?ev=1" //[GET] : {ev}
//    static let ALBUM = API_GET + "photo_album?ev=1" //[GET] : {ev}
//    static let PHOTOLIST = API_GET + "photo_list?ev=1&album=" //[GET] : {ev, album}
//    //    static let PHOTODETAILALBUM = API_GET + "photo_detail?ev=1&album="
//    //    static let PHOTODETAILPHOTO = "&photo=" //[GET] : {ev, album, photo}
//    static let TIPSTRICK = API_GET + "tips?ev=1"
//    static let TIPSTRICKDETAIL = API_GET + "tips_detail?ev=1&tipid="
//    static let API_REGISTER = API_POST + "register" // [POST] : {email, fullname, password, password2}
//
//    static func GET_NOTIFICATION_DETAIL(userId : String, notId : String) -> String{
//        let url = API_GET + "notification_read?ev=1&userid=" + userId + "&notid=" + notId
//        return url
//    }
//
//    static func GET_PHOTODETAIL(albumId : String, photoId : String) -> String{
//        let url = API_GET + "photo_detail?ev=1&album=" + albumId + "&photo=" + photoId
//
//        return url
//    }
}
