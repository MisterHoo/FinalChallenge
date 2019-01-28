//
//  AlergicFoodViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AlergicFoodViewController: UITableViewController{
    var alergic = ["nut","Sea Food"]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alergic.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlergicCell", for: indexPath) as! AlergicSelectedTableViewCell
        cell.alergicLabel.text = alergic[indexPath.row]
        cell.myTableviewController = self
        return cell
    }
    func deleteCell(cell: UITableViewCell){
        if let deletionIndexPath = tableView.indexPath(for: cell){
            alergic.remove(at: deletionIndexPath.row)
            tableView.deleteRows(at: [deletionIndexPath], with: .automatic)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
