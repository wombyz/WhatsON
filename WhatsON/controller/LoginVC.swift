//
//  LoginVC.swift
//  WhatsON
//
//  Created by Liam Ottley on 2/01/18.
//  Copyright © 2018 Liam Ottley. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore
import Firebase
import FirebaseAuth

class LoginVC: UIViewController {

    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        }

    @IBAction func facebookBtnPressed(_ sender: UIButton) {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions: [ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
        
            case .failed(let error):
                print(error)
            case .cancelled:
                print("LIAM: User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("LIAM: Logged in!")
                self.proceedButton.isHidden = false
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
            // var current : credential
            self.firebaseAuth(credential)
            }
        }
    }

        func firebaseAuth(_ credential: AuthCredential) {
            Auth.auth().signIn(with: credential) { (user, error) in
                if (error != nil) {
                    print("LIAM: Unable to sign in with firebase")
                } else {
                    print("LIAM: Sucessful sign in with firebase")
                }
            }
        }
    
    }

