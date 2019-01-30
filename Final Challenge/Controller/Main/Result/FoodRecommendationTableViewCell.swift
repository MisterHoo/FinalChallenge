//
//  FoodRecommendationTableViewCell.swift
//  Final Challenge
//
//  Created by Brandon Cornelius on 29/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol SeeAllRecommendDelegate{
    func seeAllRecommend()
}

class FoodRecommendationTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var seeAllRecommendDelegate : SeeAllRecommendDelegate?

    @IBAction func seeAllRecommend(_ sender: Any) {
        seeAllRecommendDelegate?.seeAllRecommend()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
