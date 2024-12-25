//
//  ViewController.swift
//  FirebaseInstaClone
//
//  Created by Habil Demirci on 4.12.2024.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let currentUser = Auth.auth().currentUser
        
        if currentUser != nil {
            self.performSegue(withIdentifier: "toFeedVC", sender: nil)
        }
        let keyboardDismissRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(keyboardDismissRecognizer)
        
    }
    @objc func hideKeyboard() {
        view.endEditing(true)
    }

    
    @IBAction func logInClicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata,error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
            makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
        
    }
    
    @IBAction func signUpCLicked(_ sender: Any) {
        
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (authData,error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        } else {
                makeAlert(titleInput: "Error!", messageInput: "Username/Password?")
        }
    }
    func makeAlert(titleInput:String, messageInput:String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

}

