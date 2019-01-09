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
        starsImageView[0].isUserInteractionEnabled = true
        starsImageView[1].isUserInteractionEnabled = true
        starsImageView[2].isUserInteractionEnabled = true
        starsImageView[3].isUserInteractionEnabled = true
        starsImageView[4].isUserInteractionEnabled = true
        starsImageView[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(oneStarTapped)))
        starsImageView[1].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(twoStarTapped)))
        starsImageView[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(threeStarTapped)))
        starsImageView[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fourStarTapped)))
        starsImageView[4].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fiveStarTapped)))
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @objc func oneStarTapped(){
        resetStar()
        starsImageView[0].image = UIImage(named: "StarYellow")
    }
    @objc func twoStarTapped(){
        resetStar()
        for i in 0...1{
            starsImageView[i].image = UIImage(named: "StarYellow")
        }
    }
    @objc func threeStarTapped(){
        resetStar()
        for i in 0...2{
            starsImageView[i].image = UIImage(named: "StarYellow")
        }
    }
    @objc func fourStarTapped(){
        resetStar()
        for i in 0...3{
            starsImageView[i].image = UIImage(named: "StarYellow")
        }
    }
    @objc func fiveStarTapped(){
        resetStar()
        for star in starsImageView{
            star.image = UIImage(named: "StarYellow")
        }
    }
    
    func resetStar(){
        for star in starsImageView{
            star.image = UIImage(named: "StarGray")
        }
    }

}
