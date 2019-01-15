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
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: pass) { user, error in
            if error == nil && user != nil {
                self.performSegue(withIdentifier: "toMainPage", sender: self)
            }else if email == "" || pass == ""{
                self.alertMsg(Message: "Email / Password can not be empty")
            }else {
                self.alertMsg(Message: "Invalid email address or password")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        passwordTextField.resignFirstResponder()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let user = Auth.auth().currentUser
        //autoLogin()
    }

    func autoLogin() {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user == user{
                self.performSegue(withIdentifier: "toMainPage", sender: self)
            }else{
                print("not login")
            }
        }
    }
    
    func alertMsg(Message: String) {
        let myAlert = UIAlertController(title: "Alert Message", message: Message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
}
