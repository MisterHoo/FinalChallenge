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
    
    @IBOutlet weak var selectionView: UIView!
    
    override func awakeFromNib() {
        foodNeverImage.layer.cornerRadius = 8
        selectionView.isHidden = true
        selectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
    }
    
    var check = false
    
    func checkThis(){
        foodCheck.isHidden = false
        selectionView.isHidden = false
    }
    func uncheck(){
        foodCheck.isHidden = true
        selectionView.isHidden = true
    }
}
