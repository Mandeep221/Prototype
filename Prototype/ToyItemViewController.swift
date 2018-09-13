//
//  ToyItemViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-09-12.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class ToyItemViewController: UIViewController {

    var itemIndex: Int = 0
    var imageName = ""{
        
        didSet{
            if let imageView = contentImageView{
                imageView.image = UIImage(named: imageName)
            }
        }
    }
    
    @IBOutlet weak var contentImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView.image = UIImage(named: imageName)
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

}
