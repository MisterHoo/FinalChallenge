//
//  RatingTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 09/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {


    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet var starsImageView: [UIImageView]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        starsImageView[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(oneStarTapped)))
        starsImageView[1].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(twoStarTapped)))
        starsImageView[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(threeStarTapped)))
        starsImageView[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fourStarTapped)))
        starsImageView[4].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fiveStarTapped)))
        // Initialization code
    }
    
    @objc func oneStarTapped(){
//        starsImageView[0].image
        
    }
    @objc func twoStarTapped(){
        for i in 0...1{
//            starsImageView[i].image
        }
        
    }
    @objc func threeStarTapped(){
        for i in 0...2{
//            starsImageView[i].image
        }
        
    }
    @objc func fourStarTapped(){
        for i in 0...3{
//            starsImageView[i].image
        }
        
    }
    @objc func fiveStarTapped(){
        for star in starsImageView{
//            star.image
        }
    }
    
    func resetStar(){
        for star in starsImageView{
//            star.image = 
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
