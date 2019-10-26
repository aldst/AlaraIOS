//
//  LoginViewController.swift
//  Alara
//
//  Created by alvaro Soto on 10/22/19.
//  Copyright © 2019 alvaro Soto. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func iniciarSesion(_ sender: Any) {
        
        if (correo.text != "Alvaro" || contrasena.text != "123456") {
            
            let alert = UIAlertController(title: "El nombre del usuario o la contrasena es incorrecta", message: nil, preferredStyle: .alert)
            

            
            alert.addAction(UIAlertAction(title: "Intentar de nuevo", style: .default, handler: nil))
            //alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

