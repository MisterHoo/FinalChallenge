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
        
        
        foodNeverImage.layer.cornerRadius = 8
        selectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
        selectionView.isHidden = true
        
        let shadowView = UIView(frame: CGRect(x: 0, y: 0, width: foodNeverImage.bounds.width, height: foodNeverImage.bounds.height))
        
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
