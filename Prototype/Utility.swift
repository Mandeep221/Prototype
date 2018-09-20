//
//  Utility.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-09-19.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase

class Utility{
    
    static var ref: DatabaseReference?
    
    static func updateProgressTimestamp(_ moduleType: String, _ timeElapsed: Int){
     //let d = Date().toMillis()
        
        ref = Database.database().reference()
        if let user = Auth.auth().currentUser{
            ref?.child("users").child((user.uid)).child("modules").child(moduleType).child("progress").observeSingleEvent(of: .value, with: { (snapshot) in
                
                let value = snapshot.value as? NSDictionary
                
                print("\(value)")
            
                // write the algo here now by fetching individual dates
            })
        }
    }
}

extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
}
