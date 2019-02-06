//
//  editProfileViewController.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        view.backgroundColor = TastePalColor.darkWhite
        
        navigationItem.title = "Edit Profile"
        navigationItem.largeTitleDisplayMode = .never
        
//        navigationController?.tabBarController?.hidesBottomBarWhenPushed = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        self.tabBarController?.tabBar.isHidden = true
//        self.tabBarController?.tabBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        self.tabBarController?.tabBar.isHidden = false
    }
}

extension EditProfileViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 190
        }else if indexPath.row == 1{
            return 44
        }else if indexPath.row == 2{
            return 44
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as! EditProfileInfoTableViewCell
            
            cell.profileImage.layer.cornerRadius = 4
            cell.backgroundColor = TastePalColor.darkWhite
            
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell")
            
            cell?.backgroundColor = UIColor.white
            
            cell?.textLabel?.text = "Name & Email"
            
            return cell!
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell")
            
            cell?.textLabel?.text = "Password"
            cell?.backgroundColor = UIColor.white
            
            return cell!
        }else{
            return UITableViewCell()
        }
    }
}
