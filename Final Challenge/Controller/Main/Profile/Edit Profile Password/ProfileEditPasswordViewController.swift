//
//  ProfileEditPasswordViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 14/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileEditPasswordViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let editHeader : [String] = ["New", "Verify"]
    let placeholder : [String] = ["enter new password", "re - enter new password"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.darkWhite
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        
        self.navigationItem.title = "Edit Password"
        
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

extension ProfileEditPasswordViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "editingCell") as! ProfileEditingTableViewCell
        
        cell.contentEditing.text = editHeader[indexPath.row]
        cell.textField.placeholder = placeholder[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "footerCell")
        
        cell?.detailTextLabel?.text = "Your password must be at least 8 characters long"
        cell?.textLabel?.text = ""
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
