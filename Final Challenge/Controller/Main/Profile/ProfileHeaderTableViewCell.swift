//
//  profileHeaderTableViewCell.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol ProfilePictureDelegate{
    func imageTapped()
}

class ProfileHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var profilePictureDelegate: ProfilePictureDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        profilePictureDelegate?.imageTapped()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
