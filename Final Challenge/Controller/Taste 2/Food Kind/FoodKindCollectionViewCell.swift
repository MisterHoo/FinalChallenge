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
        
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: foodKindImageView.bounds.width, height: foodKindImageView.bounds.height))
        
        shadowView.backgroundColor = UIColor.clear
        shadowView.clipsToBounds = false
        shadowView.layer.cornerRadius = 8
        
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.6
        shadowView.layer.shadowColor =
            UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 1)
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.frame, cornerRadius: 8).cgPath
        
        shadowView.layer.zPosition = -1
        
        addSubview(shadowView)
        
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
