//
//  ResultViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import CoreLocation
class ResultViewController: UIViewController {
    //MARK: outlet
    @IBOutlet weak var tableView: UITableView!

    //MARK: Variable
    let secTitle = "Review"
    var foodName:String?
    var location:CLLocationCoordinate2D?
    var food_id:Int = 0
    var resto_id:Int = 0
//    var reviews : [Review] = []
    
    var match_index : Int = 0
    
    var screenHeight = UIScreen.main.bounds.height
    
    var tastePreference : TPTastePreferencesModel?
    var reviews : [TPResultModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = TastePalColor.charcoal
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.largeTitleDisplayMode = .never
    
        tableView.tableFooterView = UIView()
        tableView.layoutIfNeeded()
        
        tastePreference = TastePalDataManager.TastePreference
        
        //TastePalDataManager.NewGuest.uid
        
        TastePalRequest.GET_TPResult(uid: TastePalDataManager.uid, foodId: food_id, restoId: resto_id, endPoint: "", successCompletion: { (ResultList, message) in
            TastePalDataManager.ResultList = ResultList
            self.reviews = ResultList.TPResultList
            
            self.match_index = self.checkMatch(listReview: ResultList.TPResultList, userTastePreference: self.tastePreference!)
            print(self.match_index)
            self.tableView.reloadData()
        }) { (message) in
            print(message)
        }
    }
    
    func checkMatch(listReview : [TPResultModel], userTastePreference : TPTastePreferencesModel) -> Int{
        
        var count : [Int] = [0,0,0]
        
        for review in listReview{
            if review.taste == userTastePreference.first_taste{
                count[0] += 1
            }else if review.taste == userTastePreference.second_taste{
                count[1] += 1
            }else if review.taste == userTastePreference.third_taste{
                count[2] += 1
            }
        }
        
        let max = count.max()
        
        if max == count[0]{
            return 1
        }else if max == count[1]{
            return 2
        }else if max == count[2]{
            return 3
        }else{
            return 0
        }
    }
    
    func checkTasteColor(taste : String) -> UIColor{
        for tasteData in BasicTasteData.basicTaste{
            if taste.capitalized == tasteData.name?.capitalized{
                return tasteData.color!
            }
        }
        
        return UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? SeeAllReviewViewController{
            dest.reviews = reviews
        }
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
            return 0.6 * screenHeight
        }else if indexPath == IndexPath(row: 1, section: 0){
            //recommended food collection
                return 0.25 * screenHeight
        }else if indexPath == IndexPath(row: 2, section: 0){
            //see all recommended
            return 44
        }else if indexPath.section == 1{
            if indexPath.row == 3{
                //see all review
                return 44
            }else{
                //review
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
                
                //food Name
                if let recivedName = foodName {
                    cell.foodName.text = foodName
                }
                
                //location
                if reviews.count != 0{
                    cell.location.text = "\(reviews[0].restaurant_name), \(reviews[0].location_name)"
                }
                
                //setMatch
                if match_index == 1{
                    cell.match.text = "Strongly matches"
                    cell.taste.text = tastePreference?.first_taste
                    cell.taste.textColor = checkTasteColor(taste: (tastePreference?.first_taste)!)
                }else if match_index == 2{
                    cell.match.text = "Matches"
                    cell.taste.text = tastePreference?.second_taste
                    cell.taste.textColor = checkTasteColor(taste: (tastePreference?.second_taste)!)
                }else if match_index == 3{
                    cell.match.text = "Fairly matches"
                    cell.taste.text = tastePreference?.third_taste
                    cell.taste.textColor = checkTasteColor(taste: (tastePreference?.third_taste)!)
                }else if match_index == 0{
                    cell.match.text = "Doesn't really match"
                    cell.taste.text = "taste"
                    cell.taste.textColor = UIColor.white
                }
                
                //set table Cell
                tableView.separatorColor = TastePalColor.olive
                cell.selectionStyle = .none
                tableView.separatorStyle = .none
                //ISI label dan image
                
                cell.userAteDelegate = self
                
                return cell
            }else if indexPath.row == 1{
                //ngeblikin recommended Food
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodRecommend") as! FoodRecommendationTableViewCell
                
//                tableView.separatorColor = TastePalColor.olive
//                tableView.separatorStyle = .singleLine
                cell.selectionStyle = .none
                
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
                
                cell.tasteLabel.layer.cornerRadius = 4
                cell.tasteLabel.clipsToBounds = true
                
                //isi cell
                
                if reviews.count != 0{
                    cell.userName.text = reviews[indexPath.row].name
                    cell.tasteLabel.text = reviews[indexPath.row].taste
                    cell.tasteLabel.backgroundColor = checkTasteColor(taste: reviews[indexPath.row].taste)
                    cell.rating.text = String(reviews[indexPath.row].rating)
                    cell.desc.text = reviews[indexPath.row].descript
                    cell.desc.sizeToFit()
                }
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
        TastePalRequest.POST_ATEFOOD(food_id: food_id, uid: TastePalDataManager.uid, successCompletion: { (AteFoodResult, message) in
            print(AteFoodResult.message)
        }) { (message) in
            print(message)
        }
    }
}

