//
//  rgMapViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/21.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit
import MapKit

class rgMapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(mapRestaurant.location, completionHandler: {
            (placemarks, error) -> Void in
            if error != nil {
                print(error!)
            }
            if let placemarks = placemarks {
                //get the first result
                let placemark = placemarks[0]
                //Add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.mapRestaurant.name
                annotation.subtitle = self.mapRestaurant.type
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    //Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                    
                }
            }
            
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
// Written by Roger
    @IBOutlet var mapView : MKMapView!
    
    var mapRestaurant : rgRestaurant!
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
