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
    
    var sweet = 0
    var salty = 0
    var sour = 0
    var savoury = 0
    var bitter = 0
    var bland = 0
    
    
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
        
        calculateTaste()
        performSegue(withIdentifier: "ToAvoid", sender: self)
    }
    
    func calculateTaste(){
        for taste in tasteNever{
            if taste.check == true{
                if taste.name == "Sweet"{
                    sweet /= 2
                }else if taste.name == "Salty"{
                    salty /= 2
                }else if taste.name == "Sour"{
                    sour /= 2
                }else if taste.name == "Savoury"{
                    savoury /= 2
                }else if taste.name == "Bitter"{
                    bitter /= 2
                }else if taste.name == "Bland"{
                    bland /= 2
                }
            }
        }
        
        var totalValue = sweet + salty + sour + savoury + bitter + bland
        
        if sweet != 0{
            
            let value : Float = Float(sweet * 100 / totalValue)
            DummyFoodPreference.tastePreference.append(TastePreference(type: .sweet, value: value))
            
            print("Sweet \(value)")
        }
        if salty != 0{
            
            let value : Float = Float(salty * 100 / totalValue)
            DummyFoodPreference.tastePreference.append(TastePreference(type: .salty, value: value))
            
            print("salty \(value)")

        }
        if sour != 0{
            
            let value : Float = Float(sour * 100 / totalValue)
            DummyFoodPreference.tastePreference.append(TastePreference(type: .sour, value: value))
            
            print("sour \(value)")

        }
        if savoury != 0{
            
            let value : Float = Float(savoury * 100 / totalValue)
            DummyFoodPreference.tastePreference.append(TastePreference(type: .savoury, value: value))
            
            print("savoury \(value)")

        }
        if bitter != 0{
            
            let value : Float = Float(bitter * 100 / totalValue)
            DummyFoodPreference.tastePreference.append(TastePreference(type: .bitter, value: value))
            
            print("bitter\(value)")

        }
        if bland != 0{
            
            let value : Float = Float(bland  * 100 / totalValue)
            DummyFoodPreference.tastePreference.append(TastePreference(type: .bland, value: value))
            
            print("bland\(value)")

        }
    }
    
}
