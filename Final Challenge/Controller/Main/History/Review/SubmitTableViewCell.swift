//
//  SubmitTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 09/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol ReviewActionDelegate{
    func submit()
}

class SubmitTableViewCell: UITableViewCell {

    var reviewActionDelegate : ReviewActionDelegate?
    @IBOutlet weak var reviewButton: UIButton!
    
    
    @IBAction func submitReview(_ sender: Any) {
        reviewActionDelegate?.submit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewButton.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
