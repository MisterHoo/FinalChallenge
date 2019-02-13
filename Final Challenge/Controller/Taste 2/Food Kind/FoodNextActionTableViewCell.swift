//
//  FoodNextActionTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 13/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol NextActionDelegate {
    func nextAction()
}

class FoodNextActionTableViewCell: UITableViewCell {

    var nextActionDelegate : NextActionDelegate?
    
    @IBAction func nextAction(_ sender: Any) {
        nextActionDelegate?.nextAction()
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
