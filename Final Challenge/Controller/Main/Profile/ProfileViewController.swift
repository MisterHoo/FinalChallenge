//
//  ProfileViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 08/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var screenHeight = UIScreen.main.bounds.height
    
    var userImage = UIImage(named: "StarGray")
    var userName = "Justine"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        navigationItem.largeTitleDisplayMode = .always
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editProfile))
        

        
        let navigationView = createNavigationView()

        navigationItem.titleView = navigationView


//        navigationView.translatesAutoresizingMaskIntoConstraints = false
//        navigationView.heightAnchor.constraint(equalToConstant: 40)
//        navigationView.bottomAnchor.constraint(equalTo: (navigationController?.navigationBar.bottomAnchor)!, constant: 0)
//        navigationView.leadingAnchor.constraint(equalTo: (navigationController?.navigationBar.leadingAnchor)!, constant: 0)
//        navigationView.trailingAnchor.constraint(equalTo: (navigationController?.navigationBar.trailingAnchor)!, constant: 0)
//
//        navigationView.layoutIfNeeded()
        
        tableView.tableFooterView = UIView()
    }
    
    @objc func editProfile(){
        performSegue(withIdentifier: "toEditProfilePage", sender: self)
    }
    
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
        navTitleView.frame.size.height = 40
        
        navTitleView.axis = .horizontal
        navTitleView.alignment = .center
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 40)
        imageView.widthAnchor.constraint(equalToConstant: 40)
        
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
    
}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            //tastePreference
            return 100
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
            
            cell.animateView()
            
            return cell
        }else if indexPath.row == 1 {
            // JADINYA FAVORITE FOOD
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteFoodTableViewCell") as! FavoriteFoodTableViewCell
            
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
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
        
        return cell
    }
}

//extension ProfileViewController: ProfilePictureDelegate {
//    func imageTapped() {
//        performSegue(withIdentifier: "toEditProfilePage", sender: self)
//    }
//}