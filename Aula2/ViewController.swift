//
//  ViewController.swift
//  Aula2
//
//  Created by Sarah Ferreira Mendes da Cunha on 04/12/2018.
//  Copyright © 2018 Sarah Ferreira Mendes da Cunha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNome: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    
    
    @IBAction func onSave(_ sender: Any) {
        let nome = tfNome.text!
        let email = tfEmail.text!
        
        if nome.count < 1 {
            // Atribuir focus ao elemento naquele instante
            tfNome.becomeFirstResponder()
            return
        }
        
        if email.count < 1 {
            // Atribuir focus ao elemento naquele instante
            tfEmail.becomeFirstResponder()
            return
        }
        
        // Criar o contacto
        let contacto = Contacto(nome: nome, email: email)
        
        // Permite aceder ao objecto AppDelegate da aplicação (onde se contra o array)
        let app = UIApplication.shared.delegate as! AppDelegate
        // Adicionar o contacto ao array
        app.lstContactos.append(contacto)
        
        // No final de guardar, saltar para a lista de contactos
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

