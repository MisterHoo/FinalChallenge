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
        return (alergic.count + 1)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < (alergic.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: "AlergicCell", for: indexPath) as! AlergicSelectedTableViewCell
            cell.alergicLabel.text = alergic[indexPath.row]
            cell.myTableviewController = self
            
            return cell
        }else {
            print("masuk")
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddFoodTableViewCell") as! AddFoodTableViewCell
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.count != alergic.endIndex{
            
            return 44
        }else {
            return 44
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            alergic.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row < (alergic.count){
            return UITableViewCell.EditingStyle.delete
        }else {
            
            return UITableViewCell.EditingStyle.none
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        alergicTableView.register(UINib(nibName: "AddFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "AddFoodTableViewCell")
        // Do any additional setup after loading the view.
    }

}
