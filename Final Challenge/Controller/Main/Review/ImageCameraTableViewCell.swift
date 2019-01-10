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
    
    
    @IBOutlet weak var photoFromCamera: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    
    var cameraSystemDelegate : CameraSystemDelegate?
    
    @IBAction func takePhoto(_ sender: Any) {
        cameraSystemDelegate?.openCamera()
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
