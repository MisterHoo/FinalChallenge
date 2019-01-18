//
//  IntroductionViewController.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "toTastePreferencePage", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
