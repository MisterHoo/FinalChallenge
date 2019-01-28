//
//  ProfileViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTableViewCell") as! ProfileHeaderTableViewCell
            
            cell.profilePictureDelegate = self
            
            return cell
        }else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TastePreferenceTableViewCell") as! TastePreferenceTableViewCell
            
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NearRecommendedTableViewCell") as! NearRecommendedTableViewCell
            
            return cell
        }else if indexPath.row == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteFoodTableViewCell") as! FavoriteFoodTableViewCell
            
            return cell
        }else {
            return UITableViewCell()
        }
    }
}

extension ProfileViewController: ProfilePictureDelegate {
    func imageTapped() {
        performSegue(withIdentifier: "toEditProfilePage", sender: self)
    }
    
    
}
