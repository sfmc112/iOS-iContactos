//
//  Contacto.swift
//  Aula2
//
//  Created by Sarah Ferreira Mendes da Cunha on 04/12/2018.
//  Copyright © 2018 Sarah Ferreira Mendes da Cunha. All rights reserved.
//

import Foundation

class Contacto{
    var nome: String
    var email: String
    
    init(nome: String, email: String){
        self.nome = nome
        self.email = email
    }
    
    var description : String{
        return "\(nome) [\(email)]"
    }
}
