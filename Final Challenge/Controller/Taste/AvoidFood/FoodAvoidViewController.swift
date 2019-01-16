//
//  FoodAvoidViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 11/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class FoodAvoidViewController: UIViewController {

    let ref = Database.database().reference()
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func nextButton(_ sender: Any) {
        self.ref.child("user/\(TastePalData.uid)/avoidFood").setValue(avoidedFood)
    }
    
    var listFoods : [String] = ["Celeng", "Babi", "Cunyuk","Sapi Pesek", "Hog", "Pig", "Pork", "KEVIN"]
    var avoidedFood : [String] = []
    
    var c1 : UICollectionView?
    var c2 : UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}

extension FoodAvoidViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ListAvoidTableCell") as! ListAvoidTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvoidedTableCell") as! AvoidedTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 400
        }else{
            return 200
        }
    }
}

extension FoodAvoidViewController : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == c1{
            return listFoods.count
        }else if collectionView == c2{
            return avoidedFood.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == c1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListAvoidCollCell", for: indexPath) as! ListAvoidCollectionViewCell
            
            cell.foodName.text = listFoods[indexPath.row]
            
            return cell
        }else if collectionView == c2{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvoidedCollCell", for: indexPath) as! AvoidedCollectionViewCell
            
            cell.avoidedFoodName.text = avoidedFood[indexPath.row]
            
            return cell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == c1{
            
            avoidedFood.append(listFoods[indexPath.row])
            
            let tableCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! AvoidedTableViewCell
            
            tableCell.collectionView.reloadData()
            
            let collCell = collectionView.cellForItem(at: indexPath)
            collCell?.isUserInteractionEnabled = false
            
        }else if collectionView == c2{
            let removeAvoid = avoidedFood.remove(at: indexPath.row)
            collectionView.reloadData()
            
            let tableCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ListAvoidTableViewCell
            
            if let removedIndex = listFoods.firstIndex(of: removeAvoid){
                let collCell = tableCell.collectionView.cellForItem(at: IndexPath(row: removedIndex, section: 0))
                
                collCell?.isUserInteractionEnabled = true
            
            }
        }
    }
    
}
