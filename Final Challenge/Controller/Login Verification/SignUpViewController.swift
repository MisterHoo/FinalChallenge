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
    
    let ref = Database.database().reference()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        guard let username = nameTextField.text else { return }
        guard let email = emailTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        guard let rePass = rePasswordTextField.text else { return }
        
        if (username == "" || email == "" || pass == "" || rePass == "") {
            alertMsg(Message: "Fill the blank")
        }else if !email.contains("@") {
            alertMsg(Message: "Please fill a proper email format")
        }else if pass.count < 8{
            alertMsg(Message: "Password must contain 8 characters")
        }else if rePass != pass {
            alertMsg(Message: "Password does not match")
        }else {
            Auth.auth().createUser(withEmail: email, password: pass) { user, error in
                if error == nil && user != nil{
                    print("User created")
                    TastePalData.user.uid = user!.user.uid
                    self.ref.child("user/\(TastePalData.user.uid!)/name").setValue(username)
                    self.ref.child("user/\(TastePalData.user.uid!)/email").setValue(email)
                    self.userCreatedAlertMsg(Message: "Successfully created !")
                }else{
                    print("Error : \(error!.localizedDescription)")
                    self.alertMsg(Message: "Error occured")
                }
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    func alertMsg(Message: String) {
        let myAlert = UIAlertController(title: "Alert Message", message: Message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func userCreatedAlertMsg(Message: String) {
        let myAlert = UIAlertController(title: "Hooray !", message: Message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Continue", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        rePasswordTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
