//
//  ChooseToyViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-11.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class ChooseToyViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var contentWidth:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // for loop to loop between various toy choices
        for image in 0...4{
            let imageToDisplay = UIImage(named: "\(image).png")
            let imageView = UIImageView(image: imageToDisplay)
        
            // center coordinate at which the image will be placed on the screen
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(image)
            contentWidth += view.frame.width
            scrollView.addSubview(imageView)
            
            // position the image frame on the screen
            imageView.frame = CGRect(x: xCoordinate - 50, y: (view.frame.height / 2) - 50, width: 100, height: 100)
        }
    
        // set scrollview content size
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        
    }
    
    // to prevent the done button from getting disabled once used
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintAdjustmentMode = .normal
        self.navigationController?.navigationBar.tintAdjustmentMode = .automatic
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        performSegue(withIdentifier: "countingSegue", sender: pageControl.currentPage)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destinationVc = segue.destination as! ViewController
        destinationVc.currentToyNumber = sender as! Int
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // each page changes with an offset of 414
        
        pageControl.currentPage = Int(scrollView.contentOffset.x / CGFloat(414))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
