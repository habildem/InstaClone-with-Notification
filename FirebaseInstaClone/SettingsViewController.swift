//
//  SettingsViewController.swift
//  FirebaseInstaClone
//
//  Created by Habil Demirci on 4.12.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
           try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            print("Error")
        }
    }
    
    

}
