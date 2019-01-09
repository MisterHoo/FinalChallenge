//
//  SignUpViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        guard let username = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        guard let rePass = rePasswordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil{
                print("User created")
            }else{
                print("Error : \(error!.localizedDescription)")
            }
        }
        
        if (username == "" || email == "" || pass == "" || rePass == "") {
            alertMsg(Message: "Fill the blank")
        }else if email != "@"{
            alertMsg(Message: "Please fill a proper email format")
        }else if pass.count < 8{
            alertMsg(Message: "Password must contain 8 characters")
        }else if rePass != pass {
            alertMsg(Message: "Password does not match")
        }
    }
    
    func alertMsg(Message: String) {
        let myAlert = UIAlertController(title: "Alert Message", message: Message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
