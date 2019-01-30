//
//  ResultViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    let secTitle = "Review"
    
    var reviews : [Review] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        
    }
}

extension ResultViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
            return secTitle
        }else{
            return nil
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return 2
        }else if section == 1{
            return 3
            //return reviews.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            if indexPath.row == 0 {
                //ngebalikin information
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodInformation") as! FoodInformationTableViewCell
                
                //ISI label dan image
                
                cell.userAteDelegate = self
                
                return cell
            }else if indexPath.row == 1{
                //ngeblikin recommended Food
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodRecommend") as! FoodRecommendationTableViewCell
                
                cell.seeAllRecommendDelegate = self
                
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                
                return cell
            }else{
                return UITableViewCell()
            }
        }else if indexPath.section == 1{
            //ngebalikin cell review
            let cell = tableView.dequeueReusableCell(withIdentifier: "reviewUser") as! ReviewTableViewCell
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewSectionFooterCell") as! SectionFooterTableViewCell
            
            cell.seeAllReviewDelegate = self
            
            return UITableViewCell()
        }else{
            return nil
        }
    }
}

extension ResultViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecommendedFoodCell", for: indexPath) as! RecommendFoodCollectionViewCell
        
        return cell
    }
    
    
    
}
//extension ResultViewController : ResultActionDelegate{
//    func didAte() {
//        print("I Eat")
//        self.performSegue(withIdentifier: "ResultToGiveReview", sender: self)
//    }
//
//    func notEat() {
//        print("Not Eat")
//    }
//}
//
//extension ResultViewController : UserReviewDelegate{
//    func getReview(review: String) {
//        print("test")
//    }
//}

extension ResultViewController : SeeAllReviewDelegate{
    func seeAllReview() {
        //Isi segue buat all review
//        performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
    }
}

extension ResultViewController : SeeAllRecommendDelegate{
    func seeAllRecommend() {
        //isi segue buat all recommend
    }
    
}

extension ResultViewController : UserAteDelegate{
    func didAte() {
        //userMakan
        
    }
}

