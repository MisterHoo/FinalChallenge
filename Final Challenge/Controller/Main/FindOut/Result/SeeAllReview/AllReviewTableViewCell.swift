//
//  AllReviewTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 06/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AllReviewTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var containedIngridient: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var readMoreOutlet: UIButton!
    
    var readMoreDelegate : ReadMoreDelegate?
    
    @IBAction func readMoreAction(_ sender: Any) {
        readMoreDelegate?.ReadMore()
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
