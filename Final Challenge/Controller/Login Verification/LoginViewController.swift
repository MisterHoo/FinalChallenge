//
//  LoginViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "toSignUpPage", sender: self)
    }
    
    @IBAction func logInButton(_ sender: Any) {
        //performSegue(withIdentifier: "toMainPage", sender: self)
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.dismiss(animated: true, completion: nil)
            }else if email == "" || pass == ""{
                self.alertMsg(Message: "Email / Password can not be empty")
            }
            else {
                print("Error : \(error!.localizedDescription)")
            }
        }
        print("Successfull Login")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func alertMsg(Message: String) {
        let myAlert = UIAlertController(title: "Alert Message", message: Message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
