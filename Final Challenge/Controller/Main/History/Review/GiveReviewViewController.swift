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
    var avoidedFood: [String] = []
    
    var reviews : [Review] = []
    
    let basicTaste = BasicTasteData.basicTaste
    
    let screenHeight = UIScreen.main.bounds.height
    var favoriteButton : UIBarButtonItem?
    
    var imageCamera : UIImage = TastePalIcon.historyImage!
    
    let tastePreferenceTestV2 = UIStoryboard(name: "TastePreferenceTestV2", bundle: nil)
    
    var food_name : String = ""
    var resto_name : String = ""
    var location_name : String = ""
    var reviewId : Int = 0
    
    var lng : Float = 0
    var lat : Float = 0
    
    @IBOutlet weak var submitButton: UIButton!
    
    var selectRating : Int = 0
    var selectTaste : String = ""
    var selectDesc : String = ""
    var selectFavourite : Bool = false
    var selectFoodName : String = ""
    var selectImage : UIImage?
    
    var from : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("history long : \(lng)")
        print("history lat : \(lat)")
        
        view.backgroundColor = TastePalColor.charcoal
        
        navigationItem.title = "Review"
        navigationItem.largeTitleDisplayMode = .never
        //benerin right bar button item
        favoriteButton = UIBarButtonItem(image: TastePalIcon.heartEmpty, style: .done, target: self, action: #selector(favoriteFood))
        
        navigationItem.rightBarButtonItem = favoriteButton
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        tableView.keyboardDismissMode = .onDrag
        
        //set button submit
        
        submitButton.layer.cornerRadius = 4
        //        submitButton.backgroundColor = TastePalColor.olive
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitAction(_ sender: Any) {
        
        //selectedRating
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ImageCameraTableViewCell{
            selectFoodName = cell.foodNameF.text!
            selectRating = cell.selectedRating
            selectImage = imageCamera
        }
        
        if let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 2)) as? GiveReviewDescTableViewCell{
            selectDesc = cell.userTextView.text
        }
        
        if from == "find out"{
            if selectFoodName == ""{
                let alert = UIAlertController(title: "Please give the name of the food", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                }
                alert.addAction(action)
                present(alert, animated: true) {
                    
                }
                
                return
            }
        }
        
//        if selectImage == TastePalIcon.historyImage{
//            let alert = UIAlertController(title: "Please give Image", message: nil, preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .default) { (action) in
//            }
//            alert.addAction(action)
//            present(alert, animated: true) {
//
//            }
//            return
//        }
        
        if selectRating == 0{
            //out
            let alert = UIAlertController(title: "Please give rating", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(action)
            present(alert, animated: true) {
                
            }
            return
        
        }
        
        if selectDesc == ""{
            //out
            let alert = UIAlertController(title: "Please give description", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(action)
            present(alert, animated: true) {
                
            }
            return
        }
        
        if selectTaste == ""{
            //out
            let alert = UIAlertController(title: "Please give Dominant Taste", message: nil, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alert.addAction(action)
            present(alert, animated: true) {
                
            }
            return
        }
        
        if from == "history"{
            TastePalRequest.POST_UPDATEREVIEW(review_id: reviewId, descript: selectDesc, taste: selectTaste, rating: selectRating, food_image: "", food_image_name: "nama Makanan", food_paramter: "a", favorite_food: String(selectFavourite), successCompletion: { (UpdateModel, message) in
                let alert = UIAlertController(title: "Your review has been submitted", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.performSegue(withIdentifier: "unwindToHistory", sender: self)
                }
                alert.addAction(action)
                self.present(alert, animated: true) {
                    
                }
            }) { (message) in
                print("Failed");
            }
        }else if from == "find out"{
            let lngS = String(lng)
            let latS = String(lat)
            TastePalRequest.POST_REVIEW(desc: selectDesc, taste: selectTaste, rating: selectRating, food_image: "", favorite_food: selectFavourite, uid: TastePalDataManager.uid, lng: lng, lat: lat, food_name: selectFoodName, resto_name: resto_name, resto_location: location_name, successCompletion: { (PostReview, message) in
                print(message)
                print(self.lng)
                print(self.lat)
                let alert = UIAlertController(title: "Your review has been submitted", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default) { (action) in
                    self.performSegue(withIdentifier: "unwindToFo", sender: self)
                }
                alert.addAction(action)
                self.present(alert, animated: true) {
                    
                }
            }) { (message) in
                print(message)
            }
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        let avoidedFood = tastePreferenceTestV2.instantiateViewController(withIdentifier: "avoidedFoodSearch")
        self.present(avoidedFood, animated: true, completion: nil)
    }
    
   
    
    @objc func favoriteFood(){
        
        if favoriteButton?.image == TastePalIcon.heartEmpty{
            //jadi favorite
            favoriteButton?.image = TastePalIcon.heartFilled
            selectFavourite = true
            print("Jadi Favorite")
        }else{
            //gak jadi favorite
            favoriteButton?.image = TastePalIcon.heartEmpty
            selectFavourite = false
            print("RemoveFromFavorite")
        }
    }
//MARK: read the data after searching the food
    func readTempFood(){
        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "tempFood") ?? [String]()
        avoidedFood.append(contentsOf: myarray)
        avoidedFood.removeDuplicates()
        print(avoidedFood)
        defaults.removeObject(forKey: "tempFood")
    }
    override func viewDidAppear(_ animated: Bool) {
        readTempFood()
        tableView.reloadData()
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
            if reviews.count == 0{
                return 3
            }else{
                return reviews.count + 2
            }
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
            
            if let vcs = self.navigationController?.viewControllers{
                let previousVC = vcs[vcs.count - 2]
                if previousVC is FindOutViewController {
                    cell.foodNameF.isUserInteractionEnabled = true
                }
                else {
                    cell.foodNameF.isUserInteractionEnabled = false
                    cell.foodNameF.text = food_name
                }
            }
            cell.locationName.text = "\(resto_name), \(location_name)"
            
            cell.cameraSystemDelegate = self
            cell.photoFromCamera.image = imageCamera
            
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
                if reviews.count == 0{
                    if indexPath == IndexPath(row: 1, section: 1){
                        let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyPlaceholderText")
                        
                        return cell!
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlergenCell")
                        
                        
                        return cell!
                    }
                }else{
                    //isi yg ada reviewnya
                    if indexPath.row == avoidedFood.count + 1{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlergenCell")
                        
                        return cell!
                    }else{
                        let cell = tableView.dequeueReusableCell(withIdentifier: "AlergenCell")
                        //isi allergen
                        cell?.textLabel?.text = avoidedFood[indexPath.row]
                        
                        return cell!
                    }
                }
            }
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
    

//MARK: collectionViewTaste
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
        
        selectTaste = item.basicTasteLabel.text!
        
        item.selectedView.isHidden = false
        item.tickImage.isHidden = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let item = collectionView.cellForItem(at: indexPath) as! ReviewBasicTasteCollectionViewCell
        
        selectTaste = ""
        
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

//MARK: Image Picker
extension GiveReviewViewController : CameraSystemDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func openCamera() {
        let camera = UIImagePickerController()
        camera.delegate = self
        camera.sourceType = UIImagePickerController.SourceType.camera
        
        camera.allowsEditing = true
        camera.showsCameraControls = true
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        
        self.present(camera,animated: true){
            //After Complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{

            imageCamera = image
            print(info[UIImagePickerController.InfoKey.imageURL])
            print(image.size)
            
            setImage(image: image)
            
        }else{
            //error
        }
        
        self.dismiss(animated: true) {
            
        }
    }
    
    func setImage(image : UIImage){
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as! ImageCameraTableViewCell
        
        cell.photoFromCamera.image = image
//        cell.clipsToBounds = true
    }
}
