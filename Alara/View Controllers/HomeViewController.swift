//
//  HomeViewController.swift
//  Alara
//
//  Created by alvaro Soto on 10/22/19.
//  Copyright © 2019 alvaro Soto. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var canciones : [Cancion] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canciones = crearCanciones()
        // Do any additional setup after loading the view.
        
        //tableView.delegate = self
        //tableView.dataSource = self
    }
    
    func crearCanciones() -> [Cancion]{
        
        var tempCanciones : [Cancion] = []
        
        let cancion1 = Cancion(imagen: #imageLiteral(resourceName: "brunoMars"), titulo: "Uptown Funk")
        let cancion2 = Cancion(imagen: #imageLiteral(resourceName: "sebastianYatra"), titulo: "Runaway")
        let cancion3 = Cancion(imagen: #imageLiteral(resourceName: "maluma"), titulo: "Felices los 4")
        let cancion4 = Cancion(imagen: #imageLiteral(resourceName: "luchoQuequezana"), titulo: "Kuntur")
        let cancion5 = Cancion(imagen: #imageLiteral(resourceName: "sodaStereo"), titulo: "Persiana amaericana")
        let cancion6 = Cancion(imagen: #imageLiteral(resourceName: "brunoMars2"), titulo: "Just the way you are")
        let cancion7 = Cancion(imagen: #imageLiteral(resourceName: "backstreetBoys"), titulo: "Everybody")
        let cancion8 = Cancion(imagen: #imageLiteral(resourceName: "beatles"), titulo: "Twist and Should")
        
        
        tempCanciones.append(cancion1)
        tempCanciones.append(cancion2)
        tempCanciones.append(cancion3)
        tempCanciones.append(cancion4)
        tempCanciones.append(cancion5)
        tempCanciones.append(cancion6)
        tempCanciones.append(cancion7)
        tempCanciones.append(cancion8)
        
        return tempCanciones
    }
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return canciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cancion = canciones[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CancionVerCell") as! CancionVerCell
        
        cell.setCancion(cancion: cancion)
        
        return cell
    }
}
