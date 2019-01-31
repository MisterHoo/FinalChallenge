//
//  FavoriteFoodViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 31/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FavoriteFoodViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension FavoriteFoodViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteFoodCell")
        
//        cell?.textLabel?.text
//        cell?.imageView?.image
//        cell?.detailTextLabel?.text
        
        return cell!
    }
    
    
    
}
