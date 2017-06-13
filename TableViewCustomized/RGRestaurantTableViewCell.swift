//
//  RGRestaurantTableViewCell.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/13.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class RGRestaurantTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //Written by Roger!
    @IBOutlet var RGCellImage : UIImageView!
    @IBOutlet var RGCellName : UILabel!
    @IBOutlet var RGCellLocation : UILabel!
    @IBOutlet var RGCellType : UILabel!
    
    
    
}
