//
//  FindOutViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FindOutViewController: UIViewController {

    //MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationOutlet: UILabel!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    
    var searching: Bool = false
    var searchResult: [String] = ["Nasi Bebek Goreng","Nasi Ayam Goreng","Teromg Bakar","Perkedel Jagung","Ayam Goreng"]
    var searchTemp: [String] = []
    
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        navigationController?.navigationBar.backgroundColor = TastePalColor.charcoal
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.layoutIfNeeded()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.layoutIfNeeded()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

}

extension FindOutViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchResult.count
        }else{
            return 3

        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searching {
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchedFood") as! FoodSearchTableViewCell
            cell.searchFoodText.text = searchResult[indexPath.row]
            return cell
            
        }else{
//            if indexPath.row == 0{
//                //Location
//                let cell = tableView.dequeueReusableCell(withIdentifier: "LocationFOCell") as! LocationFOTableViewCell
//
//                tableView.separatorStyle = .none
//                cell.selectionStyle = .none
//
//                return cell
//            }else if indexPath.row == 1{
//                //Search
//                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchFOCell") as! SearchFOTableViewCell
//                tableView.separatorStyle = .none
//                cell.selectionStyle = .none
//
//                cell.searchBar.barTintColor = TastePalColor.charcoal
//
//                return cell
//            }
            if indexPath.row == 0{
                //TastePreference
                let cell = tableView.dequeueReusableCell(withIdentifier: "TastePreferenceFOCell") as! TastePreferenceFOTableViewCell
                
                tableView.separatorStyle = .none
                
                cell.reset()
                cell.selectionStyle = .none
                if(cell.baseRect.subviews.count == 0){
                    cell.animateView()
                }
                
                return cell
            }else if indexPath.row == 1{
                //collectionView
                let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMightLikeFOCell") as! FoodMightLikeFOTableViewCell
                
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                
                tableView.separatorStyle = .singleLine
                tableView.separatorColor = TastePalColor.olive
                cell.selectionStyle = .none
                cell.clipsToBounds = true
                
                return cell
            }else if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMightLikeFooter")
                
                cell?.textLabel?.text = "See All Food That You Might Like"
                cell?.selectionStyle = .none
                tableView.separatorStyle = .singleLine
                tableView.separatorColor = TastePalColor.olive
                cell?.clipsToBounds = true
                
                return cell!
            }else{
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "FindOutToResult", sender: self)
        }else if indexPath.row == 2{
            performSegue(withIdentifier: "FindOutToMightLike", sender: self)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if searching{
            return 44
        }else{
            if indexPath.row == 0{
                return 120
            }else if indexPath.row == 1{
                //it should be 0.46 (370/812)
                return 0.4 * screenHeight
            }else if indexPath.row == 2{
                return 44
            }else{
                return 0
            }
        }
    }
}

extension FindOutViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodMightLikeCollCell", for: indexPath) as! FoodMightLikeFOCollectionViewCell
        
        return cell
    }
}
extension FindOutViewController : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true
        searchBar.showsCancelButton = true
        searchResult.sort()
        searchTemp.append(contentsOf: searchResult)
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        tableView.reloadData()
        searchBar.showsCancelButton = false
        view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            searchResult.append(contentsOf: searchTemp)
            searchResult.sort()
            searchResult.removeDuplicates()
            tableView.reloadData()
        }else{
            searchResult = searchResult.filter({$0.prefix(searchText.count).lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
        }
    }
}
