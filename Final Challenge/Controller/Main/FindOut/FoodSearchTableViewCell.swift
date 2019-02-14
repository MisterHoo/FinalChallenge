//
//  FoodSearchTableViewCell.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 13/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchFoodText: UILabel!
    @IBOutlet weak var addSearchFoodOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
