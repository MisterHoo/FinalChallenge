//
//  NeverEatViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class NeverEatViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    var neverList = ["Indonesian","Japanese","Italian","Indian","Thai","Middle-East"]
    
    var neverImage: [UIImage] = [
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
        return neverList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellNever", for: indexPath) as! NeverEatCollectionViewCell
        cell.foodNeverLabel.text = neverList[indexPath.item]
        cell.foodNever.image = neverImage[indexPath.item]
        
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
