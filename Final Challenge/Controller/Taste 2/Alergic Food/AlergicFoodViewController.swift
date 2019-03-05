//
//  AlergicFoodViewController.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AlergicFoodViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var alergic:[String] = []
    var tempFood2:[String] = []
    let notificationFeddback = UINotificationFeedbackGenerator()

    @IBOutlet weak var alergicTableView: UITableView!
    //MARK: Table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if alergic.count == 0 {
            return 2
        }else{
            return alergic.count+1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if alergic.count == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell")
                cell?.backgroundColor = UIColor.clear
                tableView.separatorStyle = .none
                
                return cell!
            }else{
                print("masuk")
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddFoodTableViewCell") as! AddFoodTableViewCell
                cell.addFood.addTarget(self, action: #selector(toSearch), for: .touchUpInside)
                cell.backgroundColor = UIColor.clear
                tableView.separatorStyle = .none
                
                return cell
            }
        }else{
            if indexPath.row < (alergic.count){
                let cell = tableView.dequeueReusableCell(withIdentifier: "AlergicCell", for: indexPath) as! AlergicSelectedTableViewCell
                cell.alergicLabel.text = alergic[indexPath.row]
                cell.myTableviewController = self
                tableView.separatorStyle = .singleLine
                tableView.separatorColor = TastePalColor.olive
                return cell
            }else {
                print("masuk")
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddFoodTableViewCell") as! AddFoodTableViewCell
                cell.addFood.addTarget(self, action: #selector(toSearch), for: .touchUpInside)
                cell.backgroundColor = UIColor.clear
                tableView.separatorStyle = .none
                
                return cell
            }
        }
    }
    @objc func toSearch(){
        performSegue(withIdentifier: "ToAddFood", sender: self)
    }
    //MARK: table cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.count != alergic.endIndex{
            
            return 44
        }else {
            return 44
        }
    }
    //MARK: Commit edditing delate confirmation
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            alergic.remove(at: indexPath.row)
            notificationFeddback.notificationOccurred(.success)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row < (alergic.count){
            return UITableViewCell.EditingStyle.delete
        }else {
            
            return UITableViewCell.EditingStyle.none
        }
    }
    //MARK: Button
    @IBAction func previous(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func letsGo(_ sender: Any) {
        
        let tastePreferences = sortingTaste(tastePreferences: DummyFoodPreference.tastePreference)
        
//        print("Hasil AKHIR")
//        for taste in tastePreferences{
//            print("\(taste.type) : \(taste.value)")
//        }
        
        var taste_name : [String] = ["","","","","",""]
        var taste_value : [Float] = [0.0,0.0,0.0,0.0,0.0,0.0]
        
        for i in 0...tastePreferences.count-1{
            taste_name[i] = (tastePreferences[i].type?.rawValue)!
            taste_value[i] = tastePreferences[i].value!
        }
        
        print(taste_name)
        print(taste_value)
        
        TastePalRequest.POST_NEWGUEST(registered: "false",
                                      first_taste: taste_name[0], first_value: taste_value[0],
                                      second_taste: taste_name[1], second_value: taste_value[1],
                                      third_taste: taste_name[2], third_value: taste_value[2],
                                      fourth_taste: taste_name[3], fourth_value: taste_value[3],
                                      fifth_taste: taste_name[4], fifth_value: taste_value[4],
                                      sixth_taste: taste_name[5], sixth_value: taste_value[5],
                                      successCompletion: { (newGuest, message) in
                                    print(message)
                                    self.performSegue(withIdentifier: "ToMain", sender: self)
                                        
                                    TastePalDataManager.NewGuest = newGuest
        }) { (message) in
            print(message)
        }
        
       
    }
    
    func sortingTaste(tastePreferences : [TastePreference]) -> [TastePreference]{
        
        let result = tastePreferences.sorted { (a, b) -> Bool in
        
            if !(a.value!.isLess(than: b.value!)){
                return true
            }else{
                return false
                
            }
        }
        
        return result
    }
    
    
    //MARK: read the data after searching the food
    func readTempFood(){
        let defaults = UserDefaults.standard
        let myarray = defaults.stringArray(forKey: "tempFood") ?? [String]()
        alergic.append(contentsOf: myarray)
        alergic.removeDuplicates()
        defaults.removeObject(forKey: "tempFood")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alergicTableView.register(UINib(nibName: "AddFoodTableViewCell", bundle: nil), forCellReuseIdentifier: "AddFoodTableViewCell")
        alergicTableView.tableFooterView = UIView()
        view.backgroundColor = TastePalColor.charcoal
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        readTempFood()
        alergicTableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tempFood2.append(contentsOf: alergic)
        defaults.set(tempFood2, forKey: "tempFood2")
    }

}
