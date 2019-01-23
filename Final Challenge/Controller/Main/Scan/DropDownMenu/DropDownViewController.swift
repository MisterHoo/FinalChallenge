//
//  DropDownViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 17/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class DropDownViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationSearchBar: UISearchBar!
    
    var possibleRestaurant : [String] = []
    var foundedRestaurant : [String] = []
    var searching : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SearchLocTableViewCell", bundle: nil), forCellReuseIdentifier: "locationCell")

        // Do any additional setup after loading the view.
    }
}

extension DropDownViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return possibleRestaurant.count
        }else{
            return foundedRestaurant.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as! SearchLocTableViewCell
        
        if searching{
            
        }else{
            
        }
        
        return cell
    }
}

extension DropDownViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        possibleRestaurant = foundedRestaurant.filter({$0.prefix(searchText.count) == searchText})
        if searchBar.text != nil{
            searching = true
        }else{
            searching = false
        }
        tableView.reloadData()
    }
    
}
