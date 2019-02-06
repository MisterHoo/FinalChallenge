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
    
    var birds:[String] = ["finch", "sparrow", "eagle"]
    var tempFood:[String] = []
    
    var searchedWord = [String]()
    var searching = false
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchFood.barTintColor = TastePalColor.charcoal
        view.backgroundColor = TastePalColor.charcoal
        checkAlergic()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func done(_ sender: Any) {
        if let presenter = presentingViewController as? AlergicFoodViewController {
            presenter.alergic.append(contentsOf: tempFood)
        }
        defaults.set(tempFood, forKey: "tempFood")
        dismiss(animated: true, completion: nil)
    }
    //MARK: Table view
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
            cell.addFoodOutlet.tag = indexPath.row
            cell.addFoodOutlet.addTarget(self, action: #selector(addFoodName(sender:)), for: .touchUpInside)
        }else {
            cell.avoidedFoodLabel.text = birds[indexPath.row]
            cell.addFoodOutlet.tag = indexPath.row
            cell.addFoodOutlet.addTarget(self, action: #selector(addFoodName(sender:)), for: .touchUpInside)
        }
        return cell
    }
    //MARK: Table View Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell")
        headerCell?.backgroundColor = TastePalColor.charcoal
        return headerCell
    }
    @objc func addFoodName(sender: UIButton){
        let index = sender.tag
        if searching {
            let tempName = searchedWord[index]
            tempFood.append(searchedWord[index])
            searchedWord.remove(at: index)
            birds.removeAll{ $0 == tempName }
            searchTableView.reloadData()
            print("appemd ke temp dari searching")
        }else {
            tempFood.append(birds[index])
            birds.remove(at: index)
            searchTableView.reloadData()
            print("appemd ke temp ga searching")
        }
    }
    func checkAlergic(){
        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "tempFood2") ?? [String]()
        for food in myarray {
            if birds.contains(food) {
                birds.removeAll{ $0 == food }
            }
        }
        defaults.removeObject(forKey: "tempFood2")
    }

}
extension AddFoodViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedWord = birds.filter({ $0.prefix(searchText.count) == searchText})
        searching = true
        searchTableView.reloadData()
    }
}
