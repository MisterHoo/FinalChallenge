//
//  FoodMightLikeFOTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class FoodMightLikeFOTableViewCell: UITableViewCell {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let itemSize = collectionView.frame.width / 2 - 12
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 4, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: 1.6 * itemSize)
        
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 4
        
        collectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
