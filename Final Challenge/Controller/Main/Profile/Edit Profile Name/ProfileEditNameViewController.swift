//
//  ProfileEditNameViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 14/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileEditNameViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.darkWhite
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        self.navigationItem.title = "Edit Name & Field"
        
        self.navigationItem.largeTitleDisplayMode = .never
        

        // Do any additional setup after loading the view.
    }
    
    @objc func doneTapped(){
    
    
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
