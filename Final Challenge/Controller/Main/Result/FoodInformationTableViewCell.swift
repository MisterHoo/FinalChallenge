//
//  FoodInformationTableViewCell.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 29/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol UserAteDelegate{
    func didAte()
    
}

class FoodInformationTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var match: UILabel!
    
    var userAteDelegate : UserAteDelegate?
    
    @IBAction func AteAction(_ sender: Any) {
        userAteDelegate?.didAte()
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
