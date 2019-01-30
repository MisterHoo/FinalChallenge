//
//  SectionFooterTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 30/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol SeeAllReviewDelegate{
    func seeAllReview()
}

class SectionFooterTableViewCell: UITableViewCell {
    
    
    var seeAllReviewDelegate : SeeAllReviewDelegate?
    
    @IBAction func seeAllReview(_ sender: Any) {
        seeAllReviewDelegate?.seeAllReview()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
