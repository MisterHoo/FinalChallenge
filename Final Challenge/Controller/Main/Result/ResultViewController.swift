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
    
    var screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.largeTitleDisplayMode = .never
        
        
        
        tableView.tableFooterView = UIView()
        tableView.layoutIfNeeded()
    }
}

extension ResultViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1{
//            let header = tableView.headerView(forSection: section)
//            header?.tintColor = TastePalColor.charcoal
//            header?.textLabel?.textColor = UIColor.white
//            header?.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//            header?.textLabel?.text = secTitle
            return secTitle
        }else{
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 0, section: 0){
            //information result
            return 0.53 * screenHeight
        }else if indexPath == IndexPath(row: 1, section: 0){
                return 0.22 * screenHeight
        }else if indexPath == IndexPath(row: 2, section: 0){
            return 44
        }else if indexPath.section == 1{
            if indexPath.row == 3{
                return 44
            }else{
                return 0.2 * screenHeight
            }
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }else if section == 1{
            return 4
            //return reviews.count
        }else{
            return 0
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 1{
//            let header = tableView.headerView(forSection: section)
//            header?.tintColor = TastePalColor.charcoal
//            header?.textLabel?.textColor = UIColor.white
//            header?.textLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//            header?.textLabel?.text = secTitle
//            return header
//        }else{
//            return UIView()
//        }
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            if indexPath.row == 0 {
                //ngebalikin information
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodInformation") as! FoodInformationTableViewCell
                
                tableView.separatorColor = TastePalColor.olive
                cell.selectionStyle = .none
                tableView.separatorStyle = .none
                //ISI label dan image
                
                cell.userAteDelegate = self
                
                return cell
            }else if indexPath.row == 1{
                //ngeblikin recommended Food
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodRecommend") as! FoodRecommendationTableViewCell
                
                tableView.separatorColor = TastePalColor.olive
                cell.selectionStyle = .none
                tableView.separatorStyle = .singleLine
                
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                
                return cell
            }else if indexPath.row == 2{
                let cell = tableView.dequeueReusableCell(withIdentifier: "SeeAllRecommendCell")
                
                tableView.separatorColor = TastePalColor.olive
                cell?.selectionStyle = .none
                tableView.separatorStyle = .singleLine
                
                return cell!
            }else{
                return UITableViewCell()
            }
        }else if indexPath.section == 1{
            //ngebalikin cell review
            if indexPath.row < 3{
                let cell = tableView.dequeueReusableCell(withIdentifier: "reviewUser") as! ResultReviewTableViewCell
                cell.selectionStyle = .none
                tableView.separatorStyle = .none
                tableView.separatorColor = TastePalColor.olive
                tableView.separatorStyle = .singleLine                
                cell.userImage.layer.cornerRadius = cell.userImage.frame.width/2
                cell.readMoreDelegate = self
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewSectionFooterCell")
                
                tableView.separatorColor = TastePalColor.olive
                tableView.separatorStyle = .singleLine
                cell?.selectionStyle = .none
                
                //            cell?.textLabel?.text = "See All \() Review"
                
                return cell!
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath == IndexPath(row: 2, section: 0){
            //segue all recommend food
            performSegue(withIdentifier: "ResultToRecommend", sender: nil)
            
        }else if indexPath == IndexPath(row: 3, section: 1){
            //segue all review
            performSegue(withIdentifier: "ResultToAllReview", sender: nil)
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


extension ResultViewController : ReadMoreDelegate{
    func ReadMore() {
        //isi segue buat readmore
    }
}

extension ResultViewController : UserAteDelegate{
    func didAte() {
        //userMakan
        
    }
}

