//
//  WalkthroughPageViewController.swift
//  RGFoodPin
//
//  Created by Roger on 2017/6/11.
//  Copyright © 2017年 Roger. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["Personalize", "Locate", "Discover"]
    var pageImages = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-3"]
    var pageContent = ["Pin your favorite restaurants and create your own food guide","Search and locate your favourite restaurant on Maps", "Find restaurants pinned by your friends and other foodies around the world"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        dataSource = self
        
        // Do any additional setup after loading the view.
        //for first launch
        if let startViewController = viewControllerAt(Index: 0) {
            setViewControllers([startViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //for page view controller data source requiered funcs
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index = index + 1
        return viewControllerAt(Index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index = index - 1
        return viewControllerAt(Index: index)
    }
    
    
    func viewControllerAt(Index index:Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count || index == NSNotFound {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.content = pageContent[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
    
    func forward(_ index: Int){
        if let nextViewController = viewControllerAt(Index: index + 1) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }

    }
    
    // for walk through normal page dots
    /*
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            return pageContentViewController.index
        }
        return 0
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageHeadings.count
    }
    */
    
    // for walk through custom page dots
    
}
