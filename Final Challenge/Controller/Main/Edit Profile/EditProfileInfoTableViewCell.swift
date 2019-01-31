//
//  EditProfileInfoTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 31/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class EditProfileInfoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileEmail: UILabel!
    @IBOutlet weak var profileName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
