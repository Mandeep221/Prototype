//
//  CountingTwoViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-13.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class CountingTwoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionsView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionsView.delegate = self
        collectionsView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionsView.dequeueReusableCell(withReuseIdentifier: "customCellTwo", for: indexPath) as! CollectionViewCellTwo
       
        return cell
    }
}
