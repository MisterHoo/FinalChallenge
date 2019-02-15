//
//  ProfileEditNameViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 14/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileEditNameViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let header : [String] = ["Full Name", "Email"]
    let labelEdit : [String] = ["First","Middle","Last"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.darkWhite
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        self.navigationItem.title = "Edit Name & Field"
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfileEditingTableViewCell", bundle: nil), forCellReuseIdentifier: "editingCell")
        
        tableView.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }
    
    @objc func doneTapped(){
    
    
    }

}

extension ProfileEditNameViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }else if section == 1{
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editingCell") as! ProfileEditingTableViewCell
        if indexPath.section == 0{
            cell.contentEditing.text = labelEdit[indexPath.row]
            
            return cell
        }else{
            cell.contentEditing.text = "Email"
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell")
        
        cell?.textLabel?.text = " "
        cell?.detailTextLabel?.text = header[section]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}
