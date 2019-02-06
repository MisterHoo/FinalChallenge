//
//  FoodMightLikeViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 31/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodMightLikeViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Food You Might Like"
        
        
        
        tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension FoodMightLikeViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMightLikeCell")
        
        cell?.selectionStyle = .none
        tableView.separatorColor = TastePalColor.olive
        
//        cell?.textLabel?.text =
//        cell?.imageView?.image =
//        cell?.detailTextLabel?.text =
        
        return cell!
    }
    
    
    
}
