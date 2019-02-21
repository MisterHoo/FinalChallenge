//
//  FindOutViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class FindOutViewController: UIViewController, CLLocationManagerDelegate{

    //MARK: Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationOutlet: UILabel!
    @IBOutlet weak var searchBarOutlet: UISearchBar!
    @IBOutlet weak var restourantTableView: UITableView!
    
    var searching: Bool = false
    var searchResult: [String] = ["Nasi Bebek Goreng","Nasi Ayam Goreng","Teromg Bakar","Perkedel Jagung","Ayam Goreng"]
    var searchTemp: [String] = []
    var closestRestourantsList:[String] = []
    var distance:[Int] = []
    let screenHeight = UIScreen.main.bounds.height
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = TastePalColor.charcoal
        navigationController?.navigationBar.backgroundColor = TastePalColor.charcoal
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.tableFooterView = UIView()
        tableView.layoutIfNeeded()
        
        searchBarOutlet.tintColor = UIColor.white
        
        locationTouchable()
        setUpLocation()
        // Do any additional setup after loading the view.
    }
    func locationTouchable(){
        locationOutlet.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(searchPlace))
        locationOutlet.addGestureRecognizer(tap)
    }
    @objc func searchPlace(){
        print("it working")
        restourantTableView.isHidden = false
    }
    func setUpLocation(){
        let authorization = CLLocationManager.authorizationStatus()
        if authorization == .notDetermined{
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authorization == .denied {
            print("Location denied")
        }else{
            if CLLocationManager.locationServicesEnabled(){
                locationManager.delegate = self
                locationManager.distanceFilter = 100.0
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                locationManager.startUpdatingLocation()
            }else{
                let alert = UIAlertController(title: "Alert", message: "plese turn on location", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                print("Plese enable location")
            }
        }
       
    }
    // update when user change location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate  else {return}
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        let geo = CLGeocoder()
        let location = locations[0]
        geo.reverseGeocodeLocation(location) { (placeMark, error) in
            if error != nil {
                print("there is error\(error)")
            }else {
                if let place = placeMark?[0]{
                    self.searchInMap(currLocation: locValue)
                    let nearbyName = place.name ?? place.locality
                    
                    print(place)
                }
            }
        }
    }
    //search closest landmark
    func searchInMap(currLocation: CLLocationCoordinate2D){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Restaurant"
        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        request.region = MKCoordinateRegion(center: currLocation, span: span)
        
        let search = MKLocalSearch(request: request)
        search.start { (respons, error) in
            print("test coba nama")
            for mapItem in (respons?.mapItems)! {
                self.closestRestourantsList.append(mapItem.name!)
                let currentUserLocation = CLLocation(latitude: currLocation.latitude, longitude: currLocation.longitude)
                let landMarkLocation = CLLocation(latitude: mapItem.placemark.coordinate.latitude, longitude:  mapItem.placemark.coordinate.longitude)
                let distanceInMeters = currentUserLocation.distance(from: landMarkLocation)
                self.distance.append(Int(distanceInMeters))
                let closestRestourant = respons?.mapItems[0]
                print(respons?.mapItems[0].placemark.coordinate)
                print(respons?.mapItems[0].name)
                self.locationOutlet.text = closestRestourant?.name
                self.restourantTableView.reloadData()
            }
        }
    }
   
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.layoutIfNeeded()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        tableView.reloadData()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }

}

extension FindOutViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == restourantTableView {
            return closestRestourantsList.count
        }else {
            if searching {
                return searchResult.count
            }else{
                return 3
                
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(tableView)
        if tableView == restourantTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "restourantCell") as! RestorantTableViewCell
            cell.restourantName.text = closestRestourantsList[indexPath.row]
            cell.restourantRange.text = String(distance[indexPath.row])
            return cell
        }else {
            if searching {
                let cell = tableView.dequeueReusableCell(withIdentifier: "searchedFood") as! FoodSearchTableViewCell
                cell.searchFoodText.text = searchResult[indexPath.row]
                return cell
                
            }else{
                //            if indexPath.row == 0{
                //                //Location
                //                let cell = tableView.dequeueReusableCell(withIdentifier: "LocationFOCell") as! LocationFOTableViewCell
                //
                //                tableView.separatorStyle = .none
                //                cell.selectionStyle = .none
                //
                //                return cell
                //            }else if indexPath.row == 1{
                //                //Search
                //                let cell = tableView.dequeueReusableCell(withIdentifier: "SearchFOCell") as! SearchFOTableViewCell
                //                tableView.separatorStyle = .none
                //                cell.selectionStyle = .none
                //
                //                cell.searchBar.barTintColor = TastePalColor.charcoal
                //
                //                return cell
                //            }
                if indexPath.row == 0{
                    //TastePreference
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TastePreferenceFOCell") as! TastePreferenceFOTableViewCell
                    
                    tableView.separatorStyle = .none
                    
                    cell.reset()
                    cell.selectionStyle = .none
                    if(cell.baseRect.subviews.count == 0){
                        cell.animateView()
                    }
                    
                    return cell
                }else if indexPath.row == 1{
                    //collectionView
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMightLikeFOCell") as! FoodMightLikeFOTableViewCell
                    
                    cell.collectionView.delegate = self
                    cell.collectionView.dataSource = self
                    
                    tableView.separatorStyle = .singleLine
                    tableView.separatorColor = TastePalColor.olive
                    cell.selectionStyle = .none
                    cell.clipsToBounds = true
                    
                    return cell
                }else if indexPath.row == 2{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FoodMightLikeFooter")
                    
                    cell?.textLabel?.text = "See All Food That You Might Like"
                    cell?.selectionStyle = .none
                    tableView.separatorStyle = .singleLine
                    tableView.separatorColor = TastePalColor.olive
                    cell?.clipsToBounds = true
                    
                    return cell!
                }else{
                    return UITableViewCell()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0{
            performSegue(withIdentifier: "FindOutToResult", sender: self)
        }else if indexPath.row == 2{
            performSegue(withIdentifier: "FindOutToMightLike", sender: self)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == restourantTableView {
            return 70
        }else {
            
            if searching{
                return 44
            }else{
                if indexPath.row == 0{
                    return 120
                }else if indexPath.row == 1{
                    //it should be 0.46 (370/812)
                    return 0.4 * screenHeight
                }else if indexPath.row == 2{
                    return 44
                }else{
                    return 0
                }
            }
        }
    }
}

extension FindOutViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodMightLikeCollCell", for: indexPath) as! FoodMightLikeFOCollectionViewCell
        
        return cell
    }
}
extension FindOutViewController : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searching = true
        searchBar.showsCancelButton = true
        searchResult.sort()
        searchTemp.append(contentsOf: searchResult)
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        tableView.reloadData()
        searchBar.showsCancelButton = false
        view.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" {
            searchResult.append(contentsOf: searchTemp)
            searchResult.sort()
            searchResult.removeDuplicates()
            tableView.reloadData()
        }else{
            searchResult = searchResult.filter({$0.prefix(searchText.count).lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
        }
    }
}
