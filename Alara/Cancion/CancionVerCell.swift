//
//  CancionVerCell.swift
//  Alara
//
//  Created by Developer on 10/24/19.
//  Copyright © 2019 alvaro Soto. All rights reserved.
//

import UIKit

class CancionVerCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var titulo: UILabel!
    

    func setCancion(cancion: Cancion){
        imagen.image = cancion.imagen
        titulo.text = cancion.titulo
    }
}
