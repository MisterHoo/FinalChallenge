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
                
                return cell
            }else if indexPath.row == 1{
                //ngeblikin recommended Food
                let cell = tableView.dequeueReusableCell(withIdentifier: "foodRecommend") as! FoodRecommendationTableViewCell
                
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
}
extension ResultViewController : ResultActionDelegate{
    func didAte() {
        print("I Eat")
        self.performSegue(withIdentifier: "ResultToGiveReview", sender: self)
    }
    
    func notEat() {
        print("Not Eat")
    }
}

extension ResultViewController : UserReviewDelegate{
    func getReview(review: String) {
        print("test")
    }
    
    
}

