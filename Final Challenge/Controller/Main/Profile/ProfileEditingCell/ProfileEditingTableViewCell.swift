//
//  ProfileEditingTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 15/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileEditingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var contentEditing: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
