//
//  NeverEatViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class NeverEatViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var foodNeverList : [FoodNeverEat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodNeverList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellNever", for: indexPath) as! NeverEatCollectionViewCell
        cell.foodNeverLabel.text = foodNeverList[indexPath.item].name
//        cell.foodNeverImage.image = foodNeverList[indexPath.item].image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FoodKindCollectionViewCell
        
        if foodNeverList[indexPath.row].check == false{
            foodNeverList[indexPath.row].check = true
            cell.chekThis()
            cell.check = true
        }
        else {
            foodNeverList[indexPath.row].check = false
            cell.uncheck()
            cell.check = false
        }
        
    }

}
