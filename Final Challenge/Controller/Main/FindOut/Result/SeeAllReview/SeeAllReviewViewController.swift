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
    
    var reviews : [TPResultModel] = []
    
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
    
    func checkTasteColor(taste : String) -> UIColor{
        for tasteData in BasicTasteData.basicTaste{
            if taste.capitalized == tasteData.name?.capitalized{
                return tasteData.color!
            }
        }
        
        return UIColor.white
    }
}

extension SeeAllReviewViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllReviewCell") as! AllReviewTableViewCell
        
        cell.readMoreDelegate = self
        cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.width / 2
        
        cell.tasteLabel.text = reviews[indexPath.row].taste
        cell.tasteLabel.backgroundColor = checkTasteColor(taste: reviews[indexPath.row].taste)
        cell.tasteLabel.layer.cornerRadius = 4
        cell.tasteLabel.clipsToBounds = true
        
        cell.desc.text = reviews[indexPath.row].descript
        cell.ratingLabel.text = String(reviews[indexPath.row].rating)
        cell.userName.text = reviews[indexPath.row].name
        
//        cell?.textLabel?.text
//        cell?.detailTextLabel?.text
//        cell?.imageView?.image
//        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//        
//        let size = rectForText(text: reviews[indexPath.row].descript, font: UIFont.systemFont(ofSize: 14), maxSize: CGSize(width: screenWidth - 30, height: 20000))
//    }
//    
//    func rectForText(text: String, font: UIFont, maxSize: CGSize) -> CGSize {
//        let attrString = NSAttributedString.init(string: text, attributes: [NSAttributedString.Key.font:font])
//        let rect = attrString.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
//        let size = CGSize(width: rect.size.width, height: rect.size.height)//(, )
//        return size
//    }
}

extension SeeAllReviewViewController : ReadMoreDelegate{
    func ReadMore() {
        print("ReadMore")
    }
}
