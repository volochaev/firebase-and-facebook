//
//  ViewController.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 02/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: MaterialTextField!
    @IBOutlet weak var passwordField: MaterialTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            goToSignedInScreen()
        }
    }
    
    func goToSignedInScreen() {
        performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
    }
    
    func showErrorAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func fbBtnPressed(sender: UIButton!) {
        let facebookLogin = FBSDKLoginManager()
    
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error: \(facebookError)")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                
                DataService.sharedInstance.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { (error, authData) in
                    if error != nil {
                        print("Login failed!")
                    } else {
                        let user = ["provider": authData.provider!, "blah": "test"]
                        DataService.sharedInstance.createFirebaseUser(authData.uid, user: user)
                        
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        self.goToSignedInScreen()
                    }
                })
            }
        }
    }
    
    @IBAction func attemptLogin(sender: MaterialButton!) {
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            DataService.sharedInstance.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                if error != nil {
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataService.sharedInstance.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            if error != nil {
                                self.showErrorAlert("Could not create account", message: "Try something else")
                            } else {
                                DataService.sharedInstance.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { err, authData in
                                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                                    let user = ["provider": authData.provider!, "blah": "test"]
                                    DataService.sharedInstance.createFirebaseUser(authData.uid, user: user)
                                    self.goToSignedInScreen()
                                })
                            }
                        })
                    } else {
                        self.showErrorAlert("Authentication failed", message: "\(error)")
                    }
                } else {
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                    self.goToSignedInScreen()
                }
            })
            
        } else {
            showErrorAlert("Email and Password required", message: "You must enter an email and a password")
        }
    }
}

