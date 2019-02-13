//
//  TastePreferenceFOTableViewCell.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 28/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class TastePreferenceFOTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseRect: UIView!
    
//    var tasteView : [UIView]? = nil
    
    //    var tastePreference = TastePalData.user.tastePreference
    var tastePreferences : [TastePreference] = DummyFoodPreference.tastePreference
    
    var indexPercentage : Float = 0
    var indexDuration : Float = 0
    
    var baseWidth : Float = 0
    
    var indexLeading : CGFloat = 0
    var indexTrailing : CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        indexPercentage = 0
        indexDuration = 0
        indexLeading = 0
        baseWidth = Float(baseRect.frame.width)
        
        
//        let label = UILabel()
//        label.text = "COBA - COBA"
//        label.textColor = UIColor.white
//        label.textAlignment = .left
////        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        baseRect.addSubview(label)
//
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.leadingAnchor.constraint(equalTo: baseRect.leadingAnchor, constant: 0).isActive = true
//        label.topAnchor.constraint(equalTo: baseRect.topAnchor, constant: 0).isActive = true
//        label.bottomAnchor.constraint(equalTo: baseRect.bottomAnchor, constant: 0).isActive = true
//        label.trailingAnchor.constraint(equalTo: baseRect.trailingAnchor, constant: 0).isActive = true
//
//        label.layoutIfNeeded()
    }
    
    func reset(){
        indexPercentage = 0
        indexDuration = 0
        indexLeading = 0
        baseWidth = Float(baseRect.frame.width)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func animateView(){
        indexTrailing = CGFloat(baseWidth)
        for preference in tastePreferences{
            let view = makeTasteView(preference: preference)
            
            baseRect.addSubview(view)
            
            view.translatesAutoresizingMaskIntoConstraints = false
            
            view.heightAnchor.constraint(equalToConstant:  baseRect.frame.height).isActive = true
            view.topAnchor.constraint(equalTo: baseRect.topAnchor, constant: 0).isActive = true
            let leadingConstraint = view.leadingAnchor.constraint(equalTo: baseRect.leadingAnchor, constant: indexLeading)
            leadingConstraint.isActive = true
            
            let trailingConstraint = view.trailingAnchor.constraint(equalTo: baseRect.trailingAnchor, constant: -1000)
            trailingConstraint.isActive = true
            
            view.layoutIfNeeded()
            
            //        view.frame = baseRect.frame
            
            indexPercentage += preference.value!
            indexDuration += 1
            
            let constant : CGFloat = CGFloat(baseWidth * (100 - indexPercentage) / 100)
            print("Constant : \(constant)")
            
            UIView.animate(withDuration: 4, animations: {
//                view.trailingAnchor.constraint(equalTo: self.baseRect.trailingAnchor, constant: -constant).isActive = true
                trailingConstraint.constant = -constant
                view.layoutIfNeeded()
            }) { (true) in
                
            }
            indexLeading = (CGFloat(baseWidth) - constant)
            indexTrailing -= view.frame.width
        }
    }
    
    func makeTasteView(preference : TastePreference) -> UIView{
        let label = UILabel()
        label.text = String(format: "%.0f%%", preference.value!)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.left
        
        let view = UIView()
        view.addSubview(label)
        
//        label.addConstraints(
//            [NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0),NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0),NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0),NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0)])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 3).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3).isActive = true
        
//        baseRect.addSubview(view)
        
        view.backgroundColor = preference.tasteData?.color
        
//        view.addConstraints([NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: baseRect, attribute: .top, multiplier: 1.0, constant: 0),NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: baseRect, attribute: .bottom, multiplier: 1.0, constant: 0),NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: baseRect, attribute: .leading, multiplier: 1.0, constant: 0),NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: baseRect, attribute: .leading, multiplier: 1.0, constant: 0)])
        
        return view
    }

    
}
