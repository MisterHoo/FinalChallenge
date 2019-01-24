//
//  ReviewTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 09/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

//protocol ReviewSystemDelegate{
//    func getReview(review: String)
//
//}

class ReviewTableViewCell: UITableViewCell {

    
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    //    var reviewSystemDelegate : ReviewSystemDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        /*
         let itemSize = photoCollection.frame.width / 4 - 10
         let layout = UICollectionViewFlowLayout()
         layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
         layout.itemSize = CGSize(width: itemSize, height: itemSize)
         
         layout.minimumLineSpacing = 2
         layout.minimumInteritemSpacing = 3
         
         photoCollection.collectionViewLayout = layout
         */
        
        let itemSize = collectionView.frame.width / 3 - 8
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        layout.itemSize = CGSize(width: itemSize, height: 35)
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        
        collectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func getReview(){
//        guard let review = reviewTextField.text else {return}
//        reviewSystemDelegate?.getReview(review: review)
//    }
}


