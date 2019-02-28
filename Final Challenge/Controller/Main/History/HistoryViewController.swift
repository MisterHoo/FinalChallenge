//
//  HistoryViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var reviews : [Review] = []
    
    @IBOutlet weak var tableView: UITableView!
    
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

}

extension HistoryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell") as! HistoryTableViewCell
        
        cell.selectionStyle = .none
        tableView.separatorColor = TastePalColor.olive
        
//        cell.foodName.text = reviews[indexPath.row].name
//        cell.placeName.text = reviews[indexPath.row].place
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM d, yyyy HH:mm"
//
//        cell.dateLabel.text = formatter.string(from: reviews[indexPath.row].date!)
//
//        for i in 0...(reviews[indexPath.row].rating! - 1){
//            cell.starRatingOutlet[i].image = UIImage(named: "StarYellow")
//
//        }
//
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HistoryToReview", sender: self)
    }
    
    
}
