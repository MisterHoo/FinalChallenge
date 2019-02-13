//
//  ReviewBasicTasteCollectionViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.

import UIKit

class ReviewBasicTasteCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var basicTasteLabel: UILabel!
    @IBOutlet weak var tickImage: UIImageView!
    
    override func awakeFromNib() {
        selectedView.isHidden = true
        tickImage.isHidden = true
        selectedView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
        basicTasteLabel.highlightedTextColor = UIColor.white
    }
}
