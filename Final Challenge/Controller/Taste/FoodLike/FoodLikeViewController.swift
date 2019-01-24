//
//  FoodLikeViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 11/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import Firebase

class FoodLikeViewController: UIViewController {
    
    let ref = Database.database().reference()
    var foods : [String] = ["Ayam","Sapi","Kambing","Kucing","Anjing","BABI"]
    var foodsLike : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func nextButton(_ sender: Any) {
        if foodsLike.count == 0{
            alertMsg(Message: "Choose at least 1")
        }else {
            performSegue(withIdentifier: "toTasteDislikedPage", sender: self)
        }
    }
    
    var c1 : UICollectionView?
    var c2 : UICollectionView?
    
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
            
            let cellScaling : CGFloat = 0.8
            
            let itemWidth = collectionView.bounds.width * cellScaling
            let itemHeight = collectionView.bounds.height * cellScaling
            
            let insetX = (collectionView.bounds.width - itemWidth) / 2.0
            let insetY = (collectionView.bounds.height - itemHeight) / 2.0
            
            collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            
            c1?.collectionViewLayout = layout
            
            return CGSize(width: itemWidth, height: itemHeight)
        }else if collectionView == c2{
            
            let cellScaling : CGFloat = 0.8
            
            let itemWidth = (collectionView.bounds.width/5) * cellScaling
            let itemHeight = collectionView.bounds.height * cellScaling
            //
            //            let insetX = (collectionView.bounds.width - itemWidth) / 2.0
            //            let insetY = (collectionView.bounds.height - itemHeight) / 2.0
            //
            //            collectionView.contentInset = UIEdgeInsets(top: insetY, left: insetX, bottom: insetY, right: insetX)
            //
            //            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            //
            //            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            //
            //            c2?.collectionViewLayout = layout
            //
            return CGSize(width: itemWidth, height: itemHeight)
            
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    func alertMsg(Message: String) {
        let myAlert = UIAlertController(title: "Alert Message", message: Message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
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
            
            collCell.foodLikeLabel.text = foodsLike[indexPath.row]
            
            ref.observeSingleEvent(of: .value) { (snapshot) in
                if snapshot.childrenCount > 0 {
                    self.foodsLike.removeAll()
                    
                    for foodLikes in snapshot.children
                }
            }
            
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
            
            collectionView.cellForItem(at: indexPath)?.isUserInteractionEnabled = false
        }else if collectionView == c2{
            let collCell = collectionView.cellForItem(at: indexPath) as! FoodLikeCollectionViewCell
            
            let removedFood = foodsLike.remove(at: indexPath.row)
            
            collectionView.reloadData()
            
            let foodsCell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! FoodsTableViewCell
            
            if let removedIndex = foods.firstIndex(of: removedFood){
                let foodCell = foodsCell.collectionView.cellForItem(at: IndexPath(row: removedIndex, section: 0))
                
                foodCell?.isUserInteractionEnabled = true
            }
        }
    }
}

extension FoodLikeViewController : UIScrollViewDelegate{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        if c1 == scrollView{
            let layout = c1?.collectionViewLayout as! UICollectionViewFlowLayout
            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumInteritemSpacing
            
            var offset = targetContentOffset.pointee
            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            let roundedIndex = round(index)
            
            offset = CGPoint(x : roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
            targetContentOffset.pointee = offset
        }else if c2 == scrollView{
            //            let layout = c2?.collectionViewLayout as! UICollectionViewFlowLayout
            //            let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumInteritemSpacing
            //
            //            var offset = targetContentOffset.pointee
            //            let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
            //            let roundedIndex = round(index)
            //
            //            offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
            //            targetContentOffset.pointee = offset
            //
        }
    }
}
