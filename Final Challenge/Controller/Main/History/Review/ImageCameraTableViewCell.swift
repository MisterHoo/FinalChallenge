//
//  ImageCameraTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 09/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

protocol CameraSystemDelegate{
    func openCamera()
}

class ImageCameraTableViewCell: UITableViewCell{
    
    
    @IBOutlet var starRating: [UIImageView]!
    
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var photoFromCamera: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    
    var cameraSystemDelegate : CameraSystemDelegate?
    
    @IBAction func takePhoto(_ sender: Any) {
        cameraSystemDelegate?.openCamera()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        starRating[0].isUserInteractionEnabled = true
        starRating[1].isUserInteractionEnabled = true
        starRating[2].isUserInteractionEnabled = true
        starRating[3].isUserInteractionEnabled = true
        starRating[4].isUserInteractionEnabled = true
        starRating[0].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(oneStarTapped)))
        starRating[1].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(twoStarTapped)))
        starRating[2].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(threeStarTapped)))
        starRating[3].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fourStarTapped)))
        starRating[4].addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(fiveStarTapped)))
        
        // Initialization code
    }
    
    @objc func oneStarTapped(){
        resetStar()
        starRating[0].image = UIImage(named: "StarYellow")
    }
    @objc func twoStarTapped(){
        resetStar()
        for i in 0...1{
            starRating[i].image = UIImage(named: "StarYellow")
        }
    }
    @objc func threeStarTapped(){
        resetStar()
        for i in 0...2{
            starRating[i].image = UIImage(named: "StarYellow")
        }
    }
    @objc func fourStarTapped(){
        resetStar()
        for i in 0...3{
            starRating[i].image = UIImage(named: "StarYellow")
        }
    }
    @objc func fiveStarTapped(){
        resetStar()
        for star in starRating{
            star.image = UIImage(named: "StarYellow")
        }
    }
    
    func resetStar(){
        for star in starRating{
            star.image = UIImage(named: "StarGray")
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
