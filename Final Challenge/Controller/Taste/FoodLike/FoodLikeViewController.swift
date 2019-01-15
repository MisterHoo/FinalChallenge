//
//  FoodLikeViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 11/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodLikeViewController: UIViewController {

    var foods : [String] = ["Ayam","Sapi","Kambing","Kucing","Anjing","BABI"]
    var foodsLike : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var c1 : UICollectionView?
    var c2 : UICollectionView?
    
    let cellScaling : CGFloat = 0.8
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension FoodLikeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 400
        }else {
            return 200
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodsTableCell") as! FoodsTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            c1 = cell.collectionView
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodLikeTableCell") as! FoodsLikeTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            c2 = cell.collectionView
            
            return cell
        }
    }
}

extension FoodLikeViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == c1{
            
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = 5.0
            
            let itemWidth = collectionView.bounds.width - layout.minimumInteritemSpacing
            let itemHeight = collectionView.bounds.height
            
            return CGSize(width: itemWidth, height: itemHeight)
        }else if collectionView == c2{
            
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            layout.minimumInteritemSpacing = 5.0
            
            let itemWidth = (collectionView.bounds.width/5) - layout.minimumInteritemSpacing
            let itemHeight = collectionView.bounds.height
            
            return CGSize(width: itemWidth, height: itemHeight)
            
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(collectionView)
        if collectionView == c1 {
            return foods.count
        }else if collectionView == c2{
            return foodsLike.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == c1{
            let collCell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCollCell", for: indexPath) as! FoodCollectionViewCell
            
            collCell.foodLabel.text = foods[indexPath.row]
            
            return collCell
        }else if collectionView == c2{
            
            let collCell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodsLikeCollCell", for: indexPath) as! FoodLikeCollectionViewCell
            
            collCell.foodLikeLabel.text = foods[indexPath.row]
            
            return collCell
        }else{
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == c1{
            let collCell = collectionView.cellForItem(at: indexPath) as! FoodCollectionViewCell
            
            foodsLike.append(collCell.foodLabel.text!)
            
            let likeCell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! FoodsLikeTableViewCell
            let likeCollection = likeCell.collectionView
            likeCollection?.reloadData()
        }
    }
}
