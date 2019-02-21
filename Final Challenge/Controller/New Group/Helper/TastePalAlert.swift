//
//  TastePalAlert.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 18/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class TastePalAlert: NSObject {
    static func show(message:String){
        
        TastePalAlert.showInformation(
            title: "Alert",
            message: message
        )
    }
    
    static func showInformation(
        title:String,
        message:String){
        
        TastePalAlert.showInformation(
            title: title,
            message: message,
            viewController: (UIApplication.shared.delegate?.window!!.rootViewController!)!)
    }
    
    static func show(
        message:String,
        viewController:UIViewController){
        
        TastePalAlert.showInformation(
            title: "Alert",
            message: message,
            viewController: viewController
        )
    }
    
    static func showInformation(
        title:String,
        message:String,
        viewController:UIViewController){
        
        let alertController = UIAlertController(
            title: title,
            message:message != "" ? message : "",
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(
            title: "Ok",
            style: .default,
            handler:nil))
        
        viewController.present(
            alertController,
            animated: true,
            completion: nil
        )
    }
}
