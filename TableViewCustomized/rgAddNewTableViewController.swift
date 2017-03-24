//
//  rgAddNewTableViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/24.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

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
    private func imagePickerController(picker : UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
