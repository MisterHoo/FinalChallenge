//
//  RecommendedFoodViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 02/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class RecommendedFoodViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "Recommended Food"
        
        tableView.tableFooterView = UIView()
        

        // Do any additional setup after loading the view.
    }
}

extension RecommendedFoodViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendedTableCell")
        
        cell?.selectionStyle = .none
        
//        cell?.textLabel?.text
//        cell?.detailTextLabel?.text
//        cell?.imageView?.image
        
        return cell!
    }
    
    
    
}
