//
//  AddFoodTableViewCell.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AddFoodTableViewCell: UITableViewCell {

    @IBOutlet weak var viewAddFood: UIView!
    @IBOutlet weak var addFood: UIButton!
    var alergicFoodViewController: AlergicFoodViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func addFood(_ sender: Any) {
        
    }
    
}
