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
    var avoidedFood: [String] = []
    
    let basicTaste = BasicTasteData.basicTaste
    
    let screenHeight = UIScreen.main.bounds.height
    var favoriteButton : UIBarButtonItem?
    
    let tastePreferenceTestV2 = UIStoryboard(name: "TastePreferenceTestV2", bundle: nil)
    
    @IBOutlet weak var submitButton: UIButton!
    

    @IBAction func submitAction(_ sender: Any) {
    }
    @IBAction func addButton(_ sender: Any) {
        let avoidedFood = tastePreferenceTestV2.instantiateViewController(withIdentifier: "avoidedFoodSearch")
        self.present(avoidedFood, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        
        navigationItem.title = "Review"
        navigationItem.largeTitleDisplayMode = .never
        //benerin right bar button item
        favoriteButton = UIBarButtonItem(image: TastePalIcon.heartEmpty, style: .done, target: self, action: #selector(favoriteFood))
        
        navigationItem.rightBarButtonItem = favoriteButton
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        
        //set button submit
        
        submitButton.layer.cornerRadius = 4
//        submitButton.backgroundColor = TastePalColor.olive
        
        // Do any additional setup after loading the view.
    }
    
    @objc func favoriteFood(){
        
        if favoriteButton?.image == TastePalIcon.heartEmpty{
            //jadi favorite
            favoriteButton?.image = TastePalIcon.heartFilled
            print("Jadi Favorite")
        }else{
            //gak jadi favorite
            favoriteButton?.image = TastePalIcon.heartEmpty
            print("RemoveFromFavorite")
        }
    }
    //MARK: read the data after searching the food
    func readTempFood(){
        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "tempFood") ?? [String]()
        avoidedFood.append(contentsOf: myarray)
        avoidedFood.removeDuplicates()
        defaults.removeObject(forKey: "tempFood")
    }
    //MARK: save data temporarly for checking
    override func viewWillDisappear(_ animated: Bool) {
        var tempFood2 :[String] = []
        let defaults = UserDefaults.standard
        tempFood2.append(contentsOf: avoidedFood)
        defaults.set(tempFood2, forKey: "tempFood2")
    }
}

//MARK: TableView
extension GiveReviewViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            //camera & taste
            return 2
        }else if section == 1{
            //alergen
//            if review.count == 0{
                return 3
//            }else if{
//                return review.count + 2
//            }
        }else if section == 2{
            return 1
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == IndexPath(row: 0, section: 0){
            return 140
        }else if indexPath == IndexPath(row: 1, section: 0){
            return 0.15 * screenHeight
        }else if indexPath.section == 1{
            if indexPath.row == 0{
                //header
                return 44
            }else{
                if indexPath.row == 1{
                    //placeholder text
                    return 44
                }else{
                    //add
                    return 44
                }
            }
        }else if indexPath.section == 2{
            return 0.15 * screenHeight
        }else{
            return 0
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath == IndexPath(row: 0, section: 0){
            //description && rating
            let cell = tableView.dequeueReusableCell(withIdentifier: "CameraTableCell") as! ImageCameraTableViewCell
            cell.selectionStyle = .none
            
            cell.cameraSystemDelegate = self
            
            return cell
        }else if indexPath == IndexPath(row: 1, section: 0){
            //submit
            let cell = tableView.dequeueReusableCell(withIdentifier: "GiveReviewTasteTableCell") as! GiveReviewTasteTableViewCell
            cell.selectionStyle = .none
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            return cell
            
        }else if indexPath.section == 1{
            if indexPath == IndexPath(row: 0, section: 1){
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderAllergen")
                
                return cell!
            }else{
//            }else if review.count == 0{
                if indexPath == IndexPath(row: 1, section: 1){
                    let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyPlaceholderText")
                    
                    return cell!
                }else{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlergenCell")
                    
                    return cell!
                }
            }
//            }else{
//                //isi yg ada reviewnya
//                if indexPath.row == Review.count + 1{
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlergenCell")
//
//                    return cell!
//                }else{
//                    let cell = tableView.dequeueReusableCell(withIdentifier: "AlergenCell")
//                    //isi allergen
//
//                    return cell!
//                }
//            }
        }else if indexPath.section == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewDescTableCell") as! GiveReviewDescTableViewCell
            
            cell.userTextView.layer.cornerRadius = 4
//            cell.userTextView.text
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
}

//collectionViewTaste
extension GiveReviewViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basicTaste.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReviewTasteCell", for: indexPath) as! ReviewBasicTasteCollectionViewCell
        
        cell.backgroundColor = basicTaste[indexPath.row].color
        cell.layer.cornerRadius = 4
        cell.basicTasteLabel.text = basicTaste[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let item = collectionView.cellForItem(at: indexPath) as! ReviewBasicTasteCollectionViewCell
        
        item.selectedView.isHidden = false
        item.tickImage.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath) as! ReviewBasicTasteCollectionViewCell
        
        item.selectedView.isHidden = true
        item.tickImage.isHidden = true
    }
}

//Submit
//extension GiveReviewViewController : ReviewActionDelegate{
//    func submit() {
//        let cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! ReviewTableViewCell
//        
//        guard let review = cell.reviewTextField.text else {return}
//        
//        reviewToSubmit = review
//        
//        print(reviewToSubmit)
//    
//    }
//}

// Image Picker
extension GiveReviewViewController : CameraSystemDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func openCamera() {
        let camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = UIImagePickerController.SourceType.camera
        
        camera.allowsEditing = true
        
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
