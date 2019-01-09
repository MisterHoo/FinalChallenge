//
//  ResultActionButtonTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol ResultActionDelegate{
    func AteFood()
    func DidNotAte()
}

class ResultActionButtonTableViewCell: UITableViewCell {

    var resultActionDelegate : ResultActionDelegate?
    
    @IBAction func ButtonAteFood(_ sender: Any) {
        resultActionDelegate?.AteFood()
    }
    
    @IBAction func ButtonDidNotAte(_ sender: Any) {
        resultActionDelegate?.DidNotAte()
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
