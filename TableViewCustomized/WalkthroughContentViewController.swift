//
//  WalkthroughContentViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/6/11.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {

    @IBOutlet var headLabel : UILabel!
    @IBOutlet var contentImage :UIImageView!
    @IBOutlet var contentLabel :UILabel!
    @IBOutlet var contentDot: UIPageControl!
    @IBOutlet var button: UIButton!
    
    @IBAction func button(_ sender: Any) {
        if index < 2{
            let pageViewController = parent as! WalkthroughPageViewController
            pageViewController.forward(index)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    var index = 0
    var imageFile = ""
    var content = ""
    var heading = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        headLabel.text = heading
        contentLabel.text = content
        contentImage.image = UIImage(named: imageFile)
        contentDot.currentPage = index
        if index < 2 {
            button.titleLabel?.text = "Next"
        }
        else {
            button.setTitle("Done", for: .normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
