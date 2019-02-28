//
//  HistoryTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 23/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet var starRatingOutlet: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setInitialRating()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setInitialRating(){
        for star in starRatingOutlet{
            star.image = UIImage(named: "StarGray")
        }
    }
    
    func setRating(index : Int){
        for i in 0...index{
            starRatingOutlet[i].image = TastePalIcon.starYellow
        }
    }
}
