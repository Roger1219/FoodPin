//
//  rgRestaurant.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/17.
//  Copyright © 2017年 Roger. All rights reserved.
//

import Foundation
import CoreData

class RgRestaurant: NSManagedObject {
    @NSManaged var name : String
    @NSManaged var type : String
    @NSManaged var location : String
    @NSManaged var image : NSData?
    @NSManaged var isVisited : NSNumber?
    @NSManaged var phoneNum : String?
    @NSManaged var rating : String
    
    /*
    init(name:String, location:String, type:String, image:NSData, isVisited:String) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
 */
}
