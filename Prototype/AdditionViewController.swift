//
//  ViewControllerAddition.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-26.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class AdditionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionViewNumberOne: UICollectionView!
    
    @IBOutlet weak var collectionViewNumberTwo: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewNumberOne.delegate = self
        collectionViewNumberOne.dataSource = self
        
        collectionViewNumberTwo.delegate = self
        collectionViewNumberTwo.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionViewNumberOne
        {
            return 10
        }else{
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellUnitIndicator
        
        return cell
    }
    
    @IBAction func nextTapped(_ sender: Any) {
    // generate random number between 1 to 6
        let diceRoll1 = Int(arc4random_uniform(6) + 1)
        
        let diceRoll2 = Int(arc4random_uniform(6) + 1)
        
        
    }
}
