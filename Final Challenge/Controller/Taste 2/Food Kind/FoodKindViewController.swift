//
//  FoodKindViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodKindViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var foodPreference : [FoodPreference] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func toNever(_ sender: Any) {
        performSegue(withIdentifier: "toNeverView", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodPreference.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellKind", for: indexPath) as! FoodKindCollectionViewCell
        cell.foodKindLabel.text = foodPreference[indexPath.item].name
//        cell.foodKindImageView.image = foodPreference[indexPath.row].image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FoodKindCollectionViewCell
        
        if foodPreference[indexPath.row].like == false {
            foodPreference[indexPath.row].like = true
            cell.chekThis()
            cell.check = true
        }
        else {
            foodPreference[indexPath.row].like = false
            cell.uncheck()
            cell.check = false
        }
        
    }
}
