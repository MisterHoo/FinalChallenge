//
//  GiveReviewTasteTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 06/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class GiveReviewTasteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let itemSize = collectionView.frame.width / 3 - 3
        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        layout.itemSize = CGSize(width: itemSize, height: collectionView.frame.height/2)
        
        layout.minimumLineSpacing = 6
        layout.minimumInteritemSpacing = 3
        
        collectionView.collectionViewLayout = layout
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
