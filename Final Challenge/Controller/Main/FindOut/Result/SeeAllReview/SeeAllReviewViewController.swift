//
//  SeeAllReviewViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 02/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class SeeAllReviewViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = TastePalColor.charcoal
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "All Reviews"
        
        tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
}

extension SeeAllReviewViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllReviewCell") as! AllReviewTableViewCell
        
        cell.readMoreDelegate = self
        cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.width / 2
//        cell?.textLabel?.text
//        cell?.detailTextLabel?.text
//        cell?.imageView?.image
//        
        return cell
    }
}

extension SeeAllReviewViewController : ReadMoreDelegate{
    func ReadMore() {
        print("ReadMore")
    }
}
