//
//  SignUpViewController.swift
//  Alara
//
//  Created by alvaro Soto on 10/22/19.
//  Copyright © 2019 alvaro Soto. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var correo: UITextField!
    @IBOutlet weak var contrasena: UITextField!
    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellido: UITextField!
    @IBOutlet weak var registratse: UIButton!
    @IBOutlet weak var error: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        error.alpha = 0
    }

    @IBAction func registrarse(_ sender: Any) {
        
        //validate the users
        let err = validateFields()
        
        if err != nil {
            
            showError(err!)
        }else
        {
            //crate cleaned version of the data
            let firstName = nombre.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = apellido.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Email = correo.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Password = contrasena.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: Email, password: Password ) { (result, err) in
                
                if err != nil {
                    
                    self.showError("Error creando el usuario")
                }else{
                    let db = Firestore.firestore()
                    
                    db.collection("usuarios").addDocument(data: ["firstname" : firstName,
                                                                 "lastname": lastName, "uid" : result!.user.uid ]) { (error) in
                                                                    
                                                                    if error != nil {
                                                                        self.showError("Error guardando la informacion del usuario")
                                                                    }
                    }
                    
                    self.trasitionToHome()
                }
            }
        }
        
        //transition to the home screen
    }
    
    //check the field and validate that is correct
    func validateFields() -> String? {
        
        //check that all fields are filled
        if nombre.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           apellido.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           correo.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           contrasena.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Pro favor, llenar todos los datos"
        }
        
        return nil
    }
    
    func showError(_ message: String){
        error.text = message
        error.alpha = 1
        
    }
    
    func trasitionToHome(){
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
        HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
