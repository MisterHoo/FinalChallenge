//
//  FavoriteFoodViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 31/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FavoriteFoodViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Favorite Food"
        navigationItem.largeTitleDisplayMode = .never

        tableView.tableFooterView = UIView()
        
        // Do any additional setup after loading the view.
    }
    
    func setTabBarVisible(visible:Bool, animated:Bool) {
        
        //* This cannot be called before viewDidLayoutSubviews(), because the frame is not set before this time
        
        // bail if the current state matches the desired state
        
        // get a frame calculation ready
        
        
        
//        self.view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height+66)
        
//        let frame = self.tabBarController?.tabBar.frame
//        let height = frame?.size.height
//        let offsetY = (visible ? -height! : height)
//
//        // zero duration means no animation
//        let duration : TimeInterval = (animated ? 0.3 : 0.0)
//
//        self.tabBarController?.tabBar.frame = (frame?.offsetBy(dx: 0, dy: offsetY!))!
        
        //  animate the tabBar
//        if frame != nil {
//            UIView.animateWithDuration(duration) {
//
//                return
//            }
//        }
    }
}

extension FavoriteFoodViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteFoodCell")
        
        cell?.selectionStyle = .none
        tableView.separatorColor = TastePalColor.olive
        
//        cell?.textLabel?.text
//        cell?.imageView?.image
//        cell?.detailTextLabel?.text
        
        return cell!
    }
    
    
    
}
