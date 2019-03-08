//
//  HistoryViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var reviews : [TPReviewModel] = []
    
    @IBOutlet weak var tableView: UITableView!

    var selectReviewId = 0
    var selectFoodName = ""
    var selectRestoName = ""
    var selectLocationName = ""
    
    @IBAction func unwindToHistory(segue:UIStoryboardSegue) {
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.tableFooterView = UIView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(showFilter))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        let filterButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        UIBarButtonItem.appearance().setTitleTextAttributes(filterButtonAttributes , for: .normal)
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        TastePalRequest.GET_TPReview(uid: TastePalDataManager.uid, endPoint: "", successCompletion: { (reviewList, message) in
            TastePalDataManager.Review = reviewList
            self.reviews = reviewList.TPReviewList
            print("Berhasil")
            
            self.tableView.reloadData()
        }) { (message) in
            print("Gagal")
        }
    }
    
    @objc func showFilter(){
        print("Filter")
        let alert = UIAlertController(title: "Filter History", message: nil, preferredStyle: .actionSheet)
        
        let removeAction = UIAlertAction(title: "Remove Filter", style: .destructive) { (action) in
            print("RemoveFilter")
        }
        
        let notReviewedAction = UIAlertAction(title: "Haven't Reviewed", style: .default) { (action) in
            print("Haven't Reviewed")
        }
        
        let recentAction = UIAlertAction(title: "Recent", style: .default) { (action) in
            print("Recent")
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alert.addAction(recentAction)
        alert.addAction(notReviewedAction)
        alert.addAction(removeAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true) {
            print("ShowedUp")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? GiveReviewViewController{
            dest.food_name = selectFoodName
            dest.location_name = selectLocationName
            dest.resto_name = selectRestoName
            dest.reviewId = selectReviewId
            dest.from = "history"
        }
    }

}

extension HistoryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell") as! HistoryTableViewCell
        
        cell.selectionStyle = .none
        tableView.separatorColor = TastePalColor.olive
        
        cell.foodName.text = reviews[indexPath.row].food_name
        cell.placeName.text = "\(reviews[indexPath.row].restaurant_name), \(reviews[indexPath.row].location_name)"
        cell.setRating(index: reviews[indexPath.row].rating-1)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy HH:mm"

        cell.dateLabel.text = formatter.string(from: reviews[indexPath.row].reviewDate)
        
        //Image

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        if reviews[indexPath.row].rating == 0{
            selectReviewId = reviews[indexPath.row].review_id
            selectFoodName = reviews[indexPath.row].food_name
            selectRestoName = reviews[indexPath.row].restaurant_name
            selectLocationName = reviews[indexPath.row].location_name
            
            performSegue(withIdentifier: "HistoryToReview", sender: self)
//        }
    }
}
