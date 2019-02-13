//
//  FoodKindViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodKindViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var foodPreference : [FoodLike] = DummyFoodPreference.foodLike
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = TastePalColor.charcoal

        
        let itemSize = collectionView.frame.width / 3 - 16
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        layout.itemSize = CGSize(width: itemSize, height: 1.2 * itemSize)
        
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 16
        
        collectionView.collectionViewLayout = layout
        
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
        cell.foodKindLabel.text = foodPreference[indexPath.item].origin
        cell.foodKindImageView.image = foodPreference[indexPath.row].image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FoodKindCollectionViewCell
        
        if foodPreference[indexPath.row].like == false {
            foodPreference[indexPath.row].like = true
            cell.checkThis()
            cell.check = true
        }
        else {
            foodPreference[indexPath.row].like = false
            cell.uncheck()
            cell.check = false
        }
    }
}
