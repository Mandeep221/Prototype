//
//  HomeViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-05-16.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    var moduleType = ""
    
    @IBOutlet var logoutButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if user not logged in, hide logout button
        let user = Auth.auth().currentUser
        
        if(user == nil){
            // user not logged in
            print("Out")
        logoutButton.title = "Log in"
          //  self.navigationItem.rightBarButtonItem = nil
            //self.navigationItem.rightBarButtonItem = self.logoutButton
        }else
        {
            print("Logged in")
        }
    }
    
    
    func onLevelSelected(_ difficultyLevel: Int) ->(){
        
        // save difficulty level to use in later screens
        UserDefaults.standard.set(difficultyLevel, forKey: moduleType)
        
        switch moduleType {
        case "counting":
            performSegue(withIdentifier: "chooseToySegue", sender: nil)
            //performSegue(withIdentifier: "selectToySegue", sender: nil)
            break
        case "addsub":
            performSegue(withIdentifier: "addSubSegue", sender: nil)
            break
        case "muldiv":
            break
        default:
            print("Something wrong with module selection")
        }
    }

    // log out the user
    @IBAction func logoutClicked(_ sender: UIBarButtonItem) {
        
        if let user = Auth.auth().currentUser{
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
            let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
            kAppDelegate.showLoginViewController()
        }else{
            performSegue(withIdentifier: "loginSegue", sender: nil)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countingTapped(_ sender: Any) {
        moduleType = "counting"
        chooseDifficulty()
    }
    
    @IBAction func addsubtapped(_ sender: Any) {
        moduleType = "addsub"
        chooseDifficulty()
    }
    
    @IBAction func addTapped(_ sender: Any) {
        moduleType = "muldiv"
        chooseDifficulty()
    }
    
    @IBAction func subtractionTapped(_ sender: DesignableButton) {
//        moduleType = "sub"
//        chooseDifficulty()
    }

    func chooseDifficulty(){
        self.performSegue(withIdentifier: "difficultySegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "difficultySegue"{
            var vc = segue.destination as! DifficultyLevelViewController
            vc.onLevelSelected = onLevelSelected
        }
    }
}
