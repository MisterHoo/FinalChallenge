//
//  RestorantTableViewCell.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 19/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class RestorantTableViewCell: UITableViewCell {

    @IBOutlet weak var restourantName: UILabel!
    @IBOutlet weak var restourantRange: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
