//
//  ViewController.swift
//  Complekshun
//
//  Created by Derek Hsiao on 4/9/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
//import FirebaseUI

class ViewController: UIViewController{

    @IBAction func createAccount(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth()
        ]
        authUI!.providers = providers
        
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
}

extension ViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            // todo: log error
            return
        }
        
        performSegue(withIdentifier: "toPersonalInfo", sender: self)
    }
}



