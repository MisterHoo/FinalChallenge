//
//  TasteLegendProfileCollectionViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 15/02/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class TasteLegendProfileCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var tasteColor: UIView!
    @IBOutlet weak var tasteName: UILabel!
    
    override func awakeFromNib() {
        tasteColor.layer.cornerRadius = 1
    }
    
}
