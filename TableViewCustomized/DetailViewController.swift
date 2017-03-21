//
//  DetailViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/17.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        //Show the image and words
        rgImageView.image = UIImage(named: detailRestaurant.image)
        // TableView configuration
        detailTableView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.2)
        detailTableView.tableFooterView = UIView(frame: CGRect.zero)
        detailTableView.separatorColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
        // navigation bar title
        title = detailRestaurant.name
        //Enable self sizing cells
        detailTableView.estimatedRowHeight = 36
        detailTableView.rowHeight = UITableViewAutomaticDimension
        // ratingButton setting
        ratingButton.setImage(UIImage(named: detailRestaurant.rating), for: UIControlState.normal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Written by Roger
    //Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var detailRestaurant : rgRestaurant!
    @IBOutlet var rgImageView : UIImageView!
    @IBOutlet var detailTableView: UITableView!
    @IBOutlet var ratingButton: UIButton!
 

    @IBAction func close(segue:UIStoryboardSegue){
        if let reviewViewController = segue.source as? rgReviewViewController {
            let rating = reviewViewController.rating
            if  rating != "close" {
            detailRestaurant.rating = rating
            ratingButton.setImage(UIImage(named: rating), for: UIControlState.normal)
            }
            
        }
    }
    
    
    
    // TableView Cell configuration
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! RGDetailViewTableViewCell
        cell.backgroundColor = UIColor.clear
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = detailRestaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = detailRestaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = detailRestaurant.location
        case 3:
            cell.fieldLabel.text = "Have been here before ?"
            cell.valueLabel.text = detailRestaurant.isVisited ? "Yes" : "No"
        case 4:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = detailRestaurant.phoneNum
        default :
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        return cell
    }
    
    
    //show the navigation bar on swipe
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //Segue for mapView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destination = segue.destination as! rgMapViewController
            destination.mapRestaurant = detailRestaurant
        
        }
    }
}
