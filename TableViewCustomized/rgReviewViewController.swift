//
//  rgReviewViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/3/19.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class rgReviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Background Image blur effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
 /*
    //Animation Plan A
    
        // ratingStackView transforming animation
        let scale = CGAffineTransform(scaleX: 0.0, y: 0.0)  //make it small as a dot
        let translate = CGAffineTransform(translationX: 0, y: 500) // make it move to the bottom of the screen
        ratingStackView.transform = scale.concatenating(translate) // combine the above two animation together
 */
 
    //Animation Plan B
        let translate = CGAffineTransform(translationX: 0, y: 500)
        self.dislikeRating.transform = translate
        self.goodRating.transform = translate
        self.greatRating.transform = translate
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Written by Roger
        // ratingStackView transforming animation
    override func viewDidAppear(_ animated: Bool) {
        // animation without spring
            // UIView.animate(withDuration: 0.7, animations: animation1)
   /*
        //Animation Plan A
    
        // animation with spring
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.7, options: [], animations: animation1, completion: nil)
    */
    
    //Animation Plan B
        UIView.animate(withDuration: 0.7, animations: {
            self.dislikeRating.transform = CGAffineTransform.identity
        })
        UIView.animate(withDuration: 0.7, delay: 0.2, options: [], animations: {
            self.goodRating.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.4, options: [], animations: {
            self.greatRating.transform = CGAffineTransform.identity
        }, completion: nil)
    
    }
 
        
    func animation1 () -> Void {
        // set ratingStackView to its normal position and scale
        self.ratingStackView.transform = CGAffineTransform.identity
    
      }
    @IBOutlet var backgroundImageView : UIImageView!
    @IBOutlet var ratingStackView : UIStackView!
    @IBOutlet var dislikeRating: UIButton!
    @IBOutlet var goodRating: UIButton!
    @IBOutlet var greatRating: UIButton!
    
    
    
    @IBAction  func ratingSelected(sender:UIButton!) {
        switch sender.tag {
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "great"
        case 400:
            rating = "close"
        default: break
        }
        performSegue(withIdentifier: "backToDetailView", sender: sender)
    }
    
    var rating : String = ""
    
    

}
