//
//  ViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-05-09.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var toyImageView: UIImageView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var labelCount: UILabel!
    
    var currentToyNumber:Int = 0
    
    var count = 0
    
    var teddyCollection = [String]()
    //var teddyCollection = ["1", "2", "3", "4", "5", "6", "7", "8"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // assign the selected toy image
        //var yourImage: UIImage =
        toyImageView.image = UIImage(named: "\(currentToyNumber)")!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toyTapped(_ sender: Any) {
        // Increase the count
        count = count + 1
        
        // Add teddy object
        teddyCollection.append("\(count)")
        
        // update label on top
        labelCount.text = "\(count)"
        
        // reload the collections view
        collectionView.reloadData()
    }
    
    @IBAction func teddyTapped(_ sender: Any) {
        // Increase the count
        count = count + 1
        
        // Add teddy object
        teddyCollection.append("\(count)")
        
        // update label on top
        labelCount.text = "\(count)"
        
        // reload the collections view
        collectionView.reloadData()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("tapped \(teddyCollection.count)")
        return teddyCollection.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.teddyCount.text = teddyCollection[indexPath.item]
        return cell
    }
    
}

