//
//  FoodKindViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodKindViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    var foodKind = ["Indonesian","Japanese","Italian","Indian","Thai","Middle-East"]
    
    var foodKindImage: [UIImage] = [
        UIImage(named: "StarGray")! ,
        UIImage(named: "StarYellow")!,
        UIImage(named: "StarYellow")!,
        UIImage(named: "StarYellow")!,
        UIImage(named: "StarYellow")!,
        UIImage(named: "StarYellow")!,
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodKind.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellKind", for: indexPath) as! FoodKindCollectionViewCell
        cell.foodKindLabel.text = foodKind[indexPath.item]
        cell.foodKindImageView.image = foodKindImage[indexPath.item]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FoodKindCollectionViewCell
        
        if cell.check == false {
            cell.chekThis()
            cell.check = true
        }
        else {
           cell.uncheck()
            cell.check = false
        }
        
    }
}
