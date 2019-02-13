//
//  FoodKindViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodKindViewController: UIViewController{
    
    var foodPreference : [FoodLike] = DummyFoodPreference.foodLike
    
    var sweet = 0
    var salty = 0
    var sour = 0
    var savoury = 0
    var bitter = 0
    var bland = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = TastePalColor.charcoal
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorColor = UIColor.clear
        
        // Do any additional setup after loading the view.
    }
    @IBAction func toNever(_ sender: Any) {
        performSegue(withIdentifier: "toNeverView", sender: self)
    }
    
    
}

extension FoodKindViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{

            let itemSize = tableView.frame.width / 3 - 16

            let numberCell : Float = Float(foodPreference.count / 3)

            let itemHeight = Float((itemSize * 1.2) + 12) * numberCell.rounded(FloatingPointRoundingRule.up)

            return CGFloat(itemHeight)
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCollectionView") as! FoodLikeTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            cell.selectionStyle = .none
            
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "NextCell") as! FoodNextActionTableViewCell
            
            cell.nextActionDelegate = self
            cell.selectionStyle = .none
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

extension FoodKindViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
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

extension FoodKindViewController : NextActionDelegate{
    func nextAction() {
        calculateTastePreference()
        
        performSegue(withIdentifier: "toNeverView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? NeverEatViewController else {return}
        
        dest.sweet = sweet
        dest.salty = salty
        dest.sour = sour
        dest.savoury = savoury
        dest.bitter = bitter
        dest.bland = bland
    }
    
    func calculateTastePreference(){
        
        for food in foodPreference{
            if food.like == true{
                if(food.sweet == true){
                    sweet += 1
                }
                if(food.salty == true){
                    salty += 1
                }
                if(food.savoury == true){
                    savoury += 1
                }
                if(food.sour == true){
                    sour += 1
                }
                if(food.bitter == true){
                    bitter += 1
                }
                if(food.bland == true){
                    bland += 1
                }
            }
        }
    }
}
