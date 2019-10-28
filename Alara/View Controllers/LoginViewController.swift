//
//  LoginViewController.swift
//  Alara
//
//  Created by alvaro Soto on 10/22/19.
//  Copyright © 2019 alvaro Soto. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var err: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        err.alpha = 0
    }
    
    
    @IBAction func iniciarSesion(_ sender: Any) {
        
    
        
        let email = correo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let contrasena = correo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email, password: contrasena) {
            (result, error) in
            
            if error != nil {
                self.err.text = error!.localizedDescription
                self.err.alpha = 1
            }
            else{
                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
                HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
        
    }
    
}

