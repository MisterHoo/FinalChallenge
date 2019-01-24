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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

extension HistoryViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableCell") as! HistoryTableViewCell
        
        cell.foodName.text = reviews[indexPath.row].name
        cell.placeName.text = reviews[indexPath.row].place
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy HH:mm"
        
        cell.dateLabel.text = formatter.string(from: reviews[indexPath.row].date!)
        
        for i in 0...(reviews[indexPath.row].rating! - 1){
            cell.starRatingOutlet[i].image = UIImage(named: "StarYellow")
            
        }
        
        return cell
    }
    
    
    
    
}
