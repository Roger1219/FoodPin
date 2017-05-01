//
//  rgRestaurant.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/17.
//  Copyright © 2017年 Roger. All rights reserved.
//

import Foundation

class rgRestaurant {
    var name : String = ""
    var type : String = ""
    var location : String = ""
    var image : String = ""
    var isVisited : Bool = false
    var phoneNum : String = ""
    var rating : String = "rating"
    
    init(name:String, location:String, type:String, image:String, isVisited:Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
