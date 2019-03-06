//
//  ProfileViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import SpriteKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var screenHeight = UIScreen.main.bounds.height
    
    var userImage = TastePalIcon.profileImage
    var userName = "Justine"
    
    @IBOutlet weak var headerPicture: UIImageView!
    @IBOutlet weak var headerName: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    @IBAction func editProfileTapped(_ sender: Any) {
        performSegue(withIdentifier: "toEditProfilePage", sender: self)
    }
    
    var favoriteFoodList : [TPFavoriteModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = UIColor.white
        headerView.backgroundColor = TastePalColor.charcoal
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        navigationItem.largeTitleDisplayMode = .always
        
        headerPicture.layer.cornerRadius = headerPicture.frame.width / 2
        
        headerPicture.image = userImage
        headerName.text = "Hi \(userName),"
        
        TastePalRequest.GET_TPFavoriteFood(uid: TastePalDataManager.uid, endPoint: "", successCompletion: { (favoriteList, message) in
            TastePalDataManager.FavoriteFoodList = favoriteList
            self.favoriteFoodList = favoriteList.TPFavoriteList
            
            print("FAVORITE FOOD : \(self.favoriteFoodList.count)")
            
            
            self.tableView.reloadData()
        }) { (message) in
            print(message)
        }
        
        
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editProfile))
//
        
//        let navigationView = createNavigationView()
//
//        navigationItem.titleView = navigationView


//        navigationView.translatesAutoresizingMaskIntoConstraints = false
//        navigationView.heightAnchor.constraint(equalToConstant: 40)
//        navigationView.bottomAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!, constant: 0)
//        navigationView.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!, constant: 0)
//        navigationView.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor)!, constant: 0)
//
//        navigationView.layoutIfNeeded()
        
        tableView.tableFooterView = UIView()
    }
    
//    @objc func editProfile(){
//        performSegue(withIdentifier: "toEditProfilePage", sender: self)
//    }
    
    func createNavigationView() -> UIView{
        let navTitleView = UIStackView()
        let imageView = UIImageView()
        let label = UILabel()
        
        navTitleView.backgroundColor = UIColor.green
        label.backgroundColor = UIColor.blue
        imageView.backgroundColor = UIColor.red
        
        label.text = userName
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = UIColor.white
        
        imageView.image = userImage
        
//        navTitleView.addSubview(imageView)
//        navTitleView.addSubview(label)
        
        navTitleView.addArrangedSubview(imageView)
        navTitleView.addArrangedSubview(label)
        
        navTitleView.frame.size.width = 200
        navTitleView.frame.size.height = 50
        
        navTitleView.axis = .horizontal
        navTitleView.alignment = .center
        navTitleView.spacing = 4
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 50)
        imageView.widthAnchor.constraint(equalToConstant: 50)
        
//        imageView.leadingAnchor.constraint(equalTo: navTitleView.leadingAnchor, constant: 16)
//        imageView.topAnchor.constraint(equalTo: navTitleView.topAnchor, constant: 0)
//        imageView.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: 8)
//        imageView.bottomAnchor.constraint(equalTo: navTitleView.bottomAnchor, constant: 0)
        
//        label.centerYAnchor.constraint(equalTo: navTitleView.centerYAnchor, constant: 0)
//        label.trailingAnchor.constraint(equalTo: navTitleView.trailingAnchor, constant: 0)
        
        imageView.layoutIfNeeded()
        label.layoutIfNeeded()
        
//        navTitleView.frame = CGRect(x: 0, y: 0, width: (navigationController?.navigationBar.frame.width)!, height: (navigationController?.navigationBar.frame.height)!)
        
        return navTitleView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let dest = segue.destination as? FavoriteFoodViewController{
            dest.favoriteFoodList = favoriteFoodList
        }
    }
    
    override func viewWillAppear(_ animated: Bool){
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            //tastePreference
            return 120
        }else if indexPath.row == 1{
            //favorite food
            return 0.40 * screenHeight
        }else if indexPath.row == 2{
            //favorite footer
            return 44
        }else{
            return 0
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2{
            performSegue(withIdentifier: "ProfileToFavo", sender: self)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TastePreferenceTableViewCell") as! TastePreferenceTableViewCell
            
            tableView.separatorStyle = .none
            cell.reset()
            cell.selectionStyle = .none
            
            cell.retestDelegate = self
            if(cell.baseRect.subviews.count == 0){
                cell.animateView()
            }
            
            return cell
        }else if indexPath.row == 1 {
            // JADINYA FAVORITE FOOD
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteFoodTableViewCell") as! FavoriteFoodTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            if favoriteFoodList.count > 0{
                cell.collectionView.reloadData()
            }
            
            cell.selectionStyle = .none
            tableView.separatorStyle = .singleLine
            tableView.separatorColor = TastePalColor.olive
            
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteFooterCell")
            
            cell?.textLabel?.text = "See All Favorite Food"
            cell?.selectionStyle = .none
            
            tableView.separatorStyle = .singleLine
            tableView.separatorColor = TastePalColor.olive
            
            return cell!
        }else{
            return UITableViewCell()
        }
    }
    
}

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //atur isi collectionView
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteFoodCell", for: indexPath) as! FavoriteFoodCollectionViewCell
        
        cell.foodImage.layer.cornerRadius = 4
        
        if favoriteFoodList.count > 0{
            cell.foodName.text = favoriteFoodList[indexPath.row].food_name
            cell.foodLocation.text = "\(favoriteFoodList[indexPath.row].restaurant_name), \(favoriteFoodList[indexPath.row].location_name)"
        }
        
        return cell
    }
}

extension ProfileViewController : ReTestDelegate{
    func retest() {
        performSegue(withIdentifier: "ToReTest", sender: nil)
    }
}

//extension ProfileViewController: ProfilePictureDelegate {
//    func imageTapped() {
//        performSegue(withIdentifier: "toEditProfilePage", sender: self)
//    }
//}

