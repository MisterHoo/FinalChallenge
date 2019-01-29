//
//  NavBarViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 29/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class NavBarViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = self.navigationBar
        navBar.barTintColor = UIColor(red: 62/255, green: 60/255, blue: 73/255, alpha: 1)

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
