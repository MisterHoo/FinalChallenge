//
//  FoodLikeTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 13/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodLikeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let itemSize = collectionView.frame.width / 3 - 16
        let layout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 6, left: 8, bottom: 6, right: 8)
        layout.itemSize = CGSize(width: itemSize, height: 1.2 * itemSize)
        
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 16
        
        collectionView.collectionViewLayout = layout
        collectionView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
