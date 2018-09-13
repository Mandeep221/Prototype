//
//  SelectToyViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-09-13.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class SelectToyViewController: UIViewController, UIPageViewControllerDataSource {

    var pageViewController: UIPageViewController!
    let contentImages = ["0","1", "2", "3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createPageViewController()
        setupPageControl()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createPageViewController(){
        let pageController = self.storyboard?.instantiateViewController(withIdentifier: "PageController") as! UIPageViewController
        
    
        pageController.dataSource = self
        
        if contentImages.count > 0{
            let firstController = getItemContoller(0)
            let startingViewControllers = [firstController]
            
            pageController.setViewControllers(startingViewControllers as! [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        pageViewController.didMove(toParentViewController: self)
    }
    
    func setupPageControl(){
        let appearance = UIPageControl.appearance()
        appearance.pageIndicatorTintColor = UIColor.black
        appearance.currentPageIndicatorTintColor = UIColor.white
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! ToyItemViewController
        
        if itemController.itemIndex > 0{
            return getItemContoller(itemController.itemIndex-1)
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
         let itemController = viewController as! ToyItemViewController
        
        if itemController.itemIndex + 1 < contentImages.count{
            return getItemContoller(itemController.itemIndex+1)
        }
        return nil
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
       return contentImages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func currentContollerIndex() -> Int{
        let pageItemController = self.currentController()
        if let controller = pageItemController as? ToyItemViewController{
            return controller.itemIndex
        }
        return -1
    }
    
    func currentController() -> UIViewController?{
        if(self.pageViewController.viewControllers?.count)! > 0{
            return self.pageViewController.viewControllers![0]
        }
        return nil
    }
    
    func getItemContoller(_ itemIndex: Int) -> ToyItemViewController?{
        if itemIndex < contentImages.count{
            let pageItemController = self.storyboard?.instantiateViewController(withIdentifier: "ToyItemController") as! ToyItemViewController
        
            pageItemController.itemIndex = itemIndex
            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        return nil
    }
}
