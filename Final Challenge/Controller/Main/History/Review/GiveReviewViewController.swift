//
//  GiveReviewViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class GiveReviewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var reviewToSubmit = ""
    var takenPhoto : UIImage?
    
    let basicTaste = BasicTasteData.basicTaste
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
    
        // Do any additional setup after loading the view.
    }
}

extension GiveReviewViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 200
        }else if indexPath.row == 1{
            return 300
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            //description
            let cell = tableView.dequeueReusableCell(withIdentifier: "CameraTableCell") as! ImageCameraTableViewCell
            
            cell.cameraSystemDelegate = self
            
            return cell
        }else if indexPath.row == 1{
            //rating
            let cell = tableView.dequeueReusableCell(withIdentifier: "RatingTableCell") as! RatingTableViewCell
            
            return cell
        }else if indexPath.row == 1{
            //description
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableCell") as! ReviewTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
//            cell.reviewSystemDelegate = self
            
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewActionTableCell") as! SubmitTableViewCell
            
            cell.reviewActionDelegate = self
            
            return cell
        }
    }
}

extension GiveReviewViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basicTaste.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewTasteCell", for: indexPath) as! ReviewBasicTasteCollectionViewCell
        
        cell.layer.backgroundColor = basicTaste[indexPath.row].color as! CGColor
        cell.basicTasteLabel.text = basicTaste[indexPath.row].name
        
        return cell
    }
    
    
    
}

//extension GiveReviewViewController : ReviewSystemDelegate{
//    func getReview(review: String) {
//        reviewToSubmit = review
//    }
//}

extension GiveReviewViewController : ReviewActionDelegate{
    func submit() {
        let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! ReviewTableViewCell
        
        guard let review = cell.reviewTextField.text else {return}
        
        reviewToSubmit = review
        
        print(reviewToSubmit)
    
    }
}

extension GiveReviewViewController : CameraSystemDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func openCamera() {
        let camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = UIImagePickerController.SourceType.camera
        
        camera.allowsEditing = false
        
        self.present(camera,animated: true){
            //After Complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            
            takenPhoto = image
            setImage(image: image)
            
        }else{
            //error
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func setImage(image : UIImage){
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ImageCameraTableViewCell
        
        cell.imageView?.image = image
    }
}
