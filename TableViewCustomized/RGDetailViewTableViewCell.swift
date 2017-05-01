//
//  RGDetailViewTableViewCell.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/19.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class RGDetailViewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet var fieldLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
}
