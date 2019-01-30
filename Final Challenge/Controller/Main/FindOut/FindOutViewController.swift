//
//  FindOutViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FindOutViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
    }

}

extension FindOutViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            //Location
            let cell = tableView.dequeueReusableCell(withIdentifier: "LocationFOCell") as! LocationFOTableViewCell
            
            return cell
        }else if indexPath.row == 1{
            //Search
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchFOCell") as! SearchFOTableViewCell
            
            return cell
        }else if indexPath.row == 2{
            //TastePreference
            let cell = tableView.dequeueReusableCell(withIdentifier: "TastePreferenceFOCell") as! TastePreferenceFOTableViewCell
            
            cell.animateView()
            
            return cell
        }else if indexPath.row == 3{
            //collectionView
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMightLikeFOCell") as! FoodMightLikeFOTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            return cell
        }else{
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 50
        }else if indexPath.row == 1{
            return 50
        }else if indexPath.row == 2{
            return 100
        }else if indexPath.row == 3{
            //it should be 0.46 (370/812)
            return 0.5 * screenHeight
        }else {
            return 0
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
