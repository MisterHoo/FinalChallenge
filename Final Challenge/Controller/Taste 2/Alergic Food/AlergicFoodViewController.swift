//
//  AlergicFoodViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AlergicFoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var alergic = ["nut","Sea Food"]

    @IBOutlet weak var alergicTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alergic.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlergicCell", for: indexPath) as! AlergicSelectedTableViewCell
        cell.alergicLabel.text = alergic[indexPath.row]
        cell.myTableviewController = self
        if alergic.endIndex == alergic.count{
            alergic.append("Add Food")
        }
        return cell
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

}
