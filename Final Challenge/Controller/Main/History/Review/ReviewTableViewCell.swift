//
//  ReviewTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 09/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

//protocol ReviewSystemDelegate{
//    func getReview(review: String)
//
//}

class ReviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var reviewTextField: UITextField!
    
//    var reviewSystemDelegate : ReviewSystemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func getReview(){
//        guard let review = reviewTextField.text else {return}
//        reviewSystemDelegate?.getReview(review: review)
//    }
}
