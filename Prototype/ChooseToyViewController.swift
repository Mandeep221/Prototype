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
    
    var images = ["0","1", "2", "3", "4"]
    var frame = CGRect(x:0, y:0, width:0, height:0)
    
    var contentWidth:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        scrollView.delegate = self
        // for loop to loop between various toy choices
        for index in 0..<images.count{
            
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = scrollView.frame.size
            
            let imageView = UIImageView(frame: frame)
            imageView.image = UIImage(named: images[index])
            
            // center coordinate at which the image will be placed on the screen
            let xCoordinate = view.frame.midX + view.frame.width * CGFloat(index)
            contentWidth += view.frame.width
            
            self.scrollView.addSubview(imageView)
            
            // position the image frame on the screen
            imageView.frame = CGRect(x: xCoordinate - 50, y: (view.frame.height / 2) - 50, width: 100, height: 100)
        }
//        scrollView.contentSize = CGSize(width: (scrollView.frame.size.width * CGFloat(images.count)), height: scrollView.frame.size.height)
//
        // set scrollview content size
        scrollView.contentSize = CGSize(width: contentWidth, height: view.frame.height)
        scrollView.delegate = self
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
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
