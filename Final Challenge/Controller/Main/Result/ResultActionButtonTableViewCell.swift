//
//  ResultActionButtonTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol ResultActionDelegate{
    func didAte()
    func notEat()
}

class ResultActionButtonTableViewCell: UITableViewCell {

    var resultActionDelegate : ResultActionDelegate?
    
    
    @IBAction func buttonAte(_ sender: Any) {
        resultActionDelegate?.didAte()
    }
    
    @IBAction func buttonDidNotEat(_ sender: Any) {
        resultActionDelegate?.notEat()
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
