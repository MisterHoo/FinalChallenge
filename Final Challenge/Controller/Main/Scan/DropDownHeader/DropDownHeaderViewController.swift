//
//  DropDownHeaderViewController.swift
//  Final Challenge
//
//  Created by Yosua Hoo on 18/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class DropDownHeaderViewController: UIViewController {

    let bundle = Bundle.main.loadNibNamed("DropDownViewController", owner: self, options: nil)
    
    var dropDownMenu : DropDownViewController?
    
    var heightConstraint = NSLayoutConstraint()
    
    var isOpen = false
    
    @IBAction func dropDownButton(_ sender: Any) {
        if !isOpen{
            //dropDown open
            isOpen = true
            NSLayoutConstraint.deactivate([self.heightConstraint])
            self.heightConstraint.constant = 300
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropDownMenu?.view.layoutIfNeeded()
                self.dropDownMenu?.view.center.y += self.view.frame.height / 2
            }) { (true) in
                print("Done")
            }
            
            NSLayoutConstraint.activate([self.heightConstraint])
        }else{
            //dropDown close
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.heightConstraint])
            self.heightConstraint.constant = 0
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropDownMenu?.view.center.y -= self.view.frame.height / 2
                self.dropDownMenu?.view.layoutIfNeeded()
            }) { (true) in
                print("Done")
            }
            
            NSLayoutConstraint.activate([self.heightConstraint])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOpen = false
        dropDownMenu = bundle?.first as? DropDownViewController

        // Do any additional setup after loading the view.
    }
    
    override func didMove(toParent parent: UIViewController?) {
        if let dropDown = dropDownMenu{
            dropDown.view.translatesAutoresizingMaskIntoConstraints = false
            
            self.parent?.addChild(dropDown)
            dropDown.view.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
            dropDown.view.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
            dropDown.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
            heightConstraint = dropDown.view.heightAnchor.constraint(equalToConstant: 0)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
