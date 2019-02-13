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
    @IBOutlet weak var selectionView: UIView!
    

    var check = false
    
    override func awakeFromNib() {
        foodKindImageView.layer.cornerRadius = 8
        selectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
        selectionView.isHidden = true
    }

    func checkThis(){
        foodCheck.isHidden = false
        selectionView.isHidden = false
    }
    func uncheck(){
        foodCheck.isHidden = true
        selectionView.isHidden = true
    }
    
    
}
