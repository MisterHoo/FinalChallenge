//
//  NeverEatCollectionViewCell.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class NeverEatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodNeverImage: UIImageView!
    @IBOutlet weak var foodNeverLabel: UILabel!
    @IBOutlet weak var foodCheck: UIImageView!
    
    override func awakeFromNib() {
        foodNeverImage.layer.cornerRadius = 8
    }
    
    var check = false
    
    func checkThis(){
        foodCheck.isHidden = false
    }
    func uncheck(){
        foodCheck.isHidden = true
    }
}
