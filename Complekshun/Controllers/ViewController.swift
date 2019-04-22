//
//  ViewController.swift
//  Complekshun
//
//  Created by Derek Hsiao on 4/9/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

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
    
    
    @IBAction func login(_ sender: Any) {
        let authUI = FUIAuth.defaultAuthUI()
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth()
        ]
        authUI!.providers = providers
        
        let authViewController = authUI!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTabView" {
            if let dest = segue.destination as? AllAboutYouController {
                dest.userID = Auth.auth().currentUser?.uid
            }
        }
    }
}

extension ViewController: FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            // todo: log error
            return
        }
        let userID = Auth.auth().currentUser?.uid
        print(userID)
        performSegue(withIdentifier: "showTabView", sender: self)
    }
}



