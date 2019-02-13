//
//  FoodKindCollectionViewCell.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodKindCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodKindImageView: UIImageView!
    @IBOutlet weak var foodKindLabel: UILabel!
    @IBOutlet weak var foodCheck: UIImageView!
    var check = false
    
    override func awakeFromNib() {
        foodKindImageView.layer.cornerRadius = 8
    }

    func checkThis(){
        foodCheck.isHidden = false
    }
    func uncheck(){
        foodCheck.isHidden = true
    }
    
    
}
