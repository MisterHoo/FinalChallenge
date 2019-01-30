//
//  AddFoodViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 29/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var searchFood: UISearchBar!
    @IBOutlet weak var searchTableView: UITableView!
    
    var birds = ["finch", "sparrow", "eagle"]
    var tempFood:[String] = []
    
    var searchedWord = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal

        // Do any additional setup after loading the view.
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchedWord.count
        } else {
            return birds.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! SearchedFoodTableViewCell
        if searching {
            cell.avoidedFoodLabel.text = searchedWord[indexPath.row]
        }else {
            cell.avoidedFoodLabel.text = birds[indexPath.row]
        }
        return cell
    }

}
extension AddFoodViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedWord = birds.filter({ $0.prefix(searchText.count) == searchText})
        searching = true
        searchTableView.reloadData()
    }
}
