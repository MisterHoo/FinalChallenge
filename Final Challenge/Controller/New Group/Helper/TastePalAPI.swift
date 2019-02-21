//
//  TastePalAPI.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 18/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class MAEApi: NSObject {
    static func GET(url:String,
                    /*header:HTTPHeaders,*/
        showHUD:Bool,
        completion:@escaping (Any) -> Void){
        if(showHUD){
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .get,
            parameters: nil,
            encoding : URLEncoding.default/*,
             headers: header*/
            ).responseJSON{ (response) in
                
                if response.result.isSuccess {
                    SVProgressHUD.dismiss()
                    completion(response.result.value!)
                }else{
                    SVProgressHUD.dismiss()
                    TastePalAlert.show(message: "Your internet connection have a problem")
                }
        }
    }
    
    static func POST(url:String, parameter:Parameters, /*header:HTTPHeaders ,*/ showHUD:Bool, completion:@escaping (Any) -> Void){
        if(showHUD){
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.default/*,
             headers: header*/).responseJSON { (response) in
                if response.result.isSuccess {
                    SVProgressHUD.dismiss()
                    completion(response.result.value!)
                }else{
                    SVProgressHUD.dismiss()
                    TastePalAlert.show(message: "Your internet connection have a problem")
                }
        }
    }
    
    static func POST_WITH_HEADER(url:String, parameter:Parameters, header:HTTPHeaders , showHUD:Bool, completion:@escaping (Any) -> Void){
        if(showHUD){
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .post,
            parameters: parameter,
            encoding: URLEncoding.default,
            headers: header).responseJSON { (response) in
                if response.result.isSuccess {
                    SVProgressHUD.dismiss()
                    completion(response.result.value!)
                }else{
                    SVProgressHUD.dismiss()
                    TastePalAlert.show(message: "Your internet connection have a problem")
                }
        }
    }
    
    
    static func POST_WITH_UPLOAD_IMAGE(
        url:String,
        parameter:Parameters,
        imageFile:UIImage,
        imageFileName:String,
        imageParameter:String,
        showHUD:Bool,
        completion:@escaping (Any) -> Void){
        if(showHUD){
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(
                imageFile.jpegData(compressionQuality: 0.5)!,
                //                UIImageJPEGRepresentation(imageFile, 0.5)!,
                withName: imageParameter,
                fileName: imageFileName,
                mimeType: "image/jpeg")
            for (key, value) in parameter {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }
        }, to:url){ (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    completion(response.result.value!)
                }
            case .failure( _):
                SVProgressHUD.dismiss()
                TastePalAlert.show(message: "Your internet connection have a problem")
            }
        }
    }
}

