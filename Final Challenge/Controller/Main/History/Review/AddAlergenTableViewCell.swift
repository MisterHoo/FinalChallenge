//
//  AddAlergenTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 06/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol AddAlergenDelegate {
    func addAlergen()
}

class AddAlergenTableViewCell: UITableViewCell {
    
    var addAlergenDelegate : AddAlergenDelegate?
    
    @IBAction func AddAlergen(_ sender: Any) {
        addAlergenDelegate?.addAlergen()
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
