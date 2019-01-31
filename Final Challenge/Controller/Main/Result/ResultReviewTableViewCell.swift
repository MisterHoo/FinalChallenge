//
//  ResultReviewTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 31/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol ReadMoreDelegate {
    func ReadMore()
}

class ResultReviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tasteLabel: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var readMoreDelegate : ReadMoreDelegate?
    
    @IBAction func ReadMoreReview(_ sender: Any) {
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
