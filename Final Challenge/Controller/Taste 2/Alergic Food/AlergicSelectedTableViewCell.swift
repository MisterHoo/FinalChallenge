//
//  AlergicSelectedTableViewCell.swift
//  Final Challenge
//
//  Created by Kennyzi Yusuf on 24/01/19.
//  Copyright © 2019 Yosua Hoo. All rights reserved.
//

import UIKit

class AlergicSelectedTableViewCell: UITableViewCell {
    @IBOutlet weak var alergicLabel: UILabel!
    var myTableviewController: AlergicFoodViewController?
    var hapusIni:() -> Void = {}
    
    @IBAction func cancelButton(_ sender: Any) {
        myTableviewController?.deleteCell(cell: self)
        hapusIni()
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
