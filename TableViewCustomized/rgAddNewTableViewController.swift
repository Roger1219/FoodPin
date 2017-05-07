//
//  rgAddNewTableViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/24.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit
import CoreData

class rgAddNewTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Writen by Roger
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet var imageView : UIImageView!
    @IBOutlet var nameText : UITextField!
    @IBOutlet var locationText : UITextField!
    @IBOutlet var typeText : UITextField!
    @IBOutlet var phoneNum : UITextField!
    @IBOutlet var yesButton : UIButton!
    @IBOutlet var noButton : UIButton!
    var haveBeenHere : Bool = true
    var addNewRestaurant : rgRestaurant!
    
    
    // For save button
    @IBAction func saveButton() {
        //Show an alert view before save
        /*
        let alertText : String = "Name: \(nameText.text!),Location: \(locationText.text!), Type: \(typeText.text!), Havebeen: \(haveBeenHere ? "Yes" : "No")"
        let alertView = UIAlertController(title: "Tips", message: alertText, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel, handler: {(alertAction : UIAlertAction)-> Void in self.performSegue(withIdentifier: "unwindToHomeScreen", sender: self)})
        alertView.addAction(cancelButton)
        self.present(alertView, animated: true, completion: nil)
        */
        
        //Save information in core data
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            addNewRestaurant = NSEntityDescription.insertNewObject(forEntityName: "RgRestaurant",into: managedObjectContext) as! rgRestaurant
            addNewRestaurant.name = nameText.text!
            addNewRestaurant.type = typeText.text!
            addNewRestaurant.location = locationText.text!
            addNewRestaurant.phoneNum = phoneNum.text!
            if let restaurantImage = imageView.image {
                addNewRestaurant.image = UIImagePNGRepresentation(restaurantImage) as NSData?
            }
            addNewRestaurant.isVisited = haveBeenHere
        }
        // Dismiss the view controller
        dismiss(animated: true, completion: nil)
    }
    // For YES or NO buttons
    @IBAction func haveBeenButtons (sender:UIButton!){
        switch sender.tag   {
        case 0:
            yesButton.backgroundColor = UIColor.red
            noButton.backgroundColor = UIColor.lightGray
            self.haveBeenHere = true
        case 1:
            yesButton.backgroundColor = UIColor.lightGray
            noButton.backgroundColor = UIColor.red
            self.haveBeenHere = false
        default : break
        }
    }
    
    
    
    //for photos selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
                // Build photo library controller
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                
                self.present(imagePicker, animated: true, completion: nil)
                imagePicker.delegate = self
                
            }
            
            else {
                // tips about forbidden photo library
                let alert = UIAlertController(title: "Sorry", message: "You have forbidden us accessing your photo library", preferredStyle: .alert)
                let cancelButton = UIAlertAction(title: "OK", style: .cancel, handler: nil )
                alert.addAction(cancelButton)
                
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    //For photos from photo library delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
        
    }
    
}
