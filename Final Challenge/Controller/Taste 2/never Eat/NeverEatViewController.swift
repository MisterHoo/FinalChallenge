//
//  NeverEatViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class NeverEatViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var tasteNever : [TasteTest] = DummyFoodPreference.tasteNotLike
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let itemSize = collectionView.frame.width / 3 - 16
        let layout = UICollectionViewFlowLayout()
        
        //        layout.sectionInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        layout.itemSize = CGSize(width: itemSize, height: 1.2 * itemSize)
        
        layout.minimumLineSpacing = 48
        layout.minimumInteritemSpacing = 16
        
        collectionView.collectionViewLayout = layout
        
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasteNever.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellNever", for: indexPath) as! NeverEatCollectionViewCell
        cell.foodNeverLabel.text = tasteNever[indexPath.item].name
        cell.foodNeverImage.image = tasteNever[indexPath.item].image
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! NeverEatCollectionViewCell
        
        if tasteNever[indexPath.row].check == false{
            tasteNever[indexPath.row].check = true
            cell.checkThis()
            cell.check = true
        }
        else {
            tasteNever[indexPath.row].check = false
            cell.uncheck()
            cell.check = false
        }
        
    }
    //MARK: button
    
    @IBAction func previous(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func toAvoidView(_ sender: Any) {
        performSegue(withIdentifier: "ToAvoid", sender: self)
    }
    
}
