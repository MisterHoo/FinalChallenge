//
//  FoodLikeViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 11/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodLikeViewController: UIViewController {

    var foods : [String] = ["Ayam","Sapi","Kambing","Kucing","Anjing","BABI"]
    var foodsLike : [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension FoodLikeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodsTableCell") as! FoodsTableViewCell
        
        if tableView == self.tableView{
            print("fuck")
            
        }else{
            print("Poop")
            
        }
        
        return cell
        
        
    }
    
}
