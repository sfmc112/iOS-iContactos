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
    
    var delegate : RefreshTableView?
    var contactoSelecionado : Contacto?
    
    
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
        
        
        if let contacto = contactoSelecionado {
            // Editar o contacto
            contacto.nome = nome
            contacto.email = email
        }else {
            // Criar o contacto
            let contacto = Contacto(nome: nome, email: email)
            
            // Permite aceder ao objecto AppDelegate da aplicação (onde se contra o array)
            let app = UIApplication.shared.delegate as! AppDelegate
            // Adicionar o contacto ao array
            app.lstContactos.append(contacto)
            
        }
        
        // -----------------------
        
        // Opção 1
        //        if let delegate = delegate {
        //            delegate.refresh()
        //        }
        
        // OU
        
        //Opção 2
        delegate?.refresh() // Se for nil, não executa esta linha
        
        // -----------------------
        // No final de guardar, saltar para a lista de contactos
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        // Todos os componentes vão perder o firstResponder
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let contacto = contactoSelecionado {
            tfNome.text = contacto.nome
            tfEmail.text = contacto.email
        }
        
        tfNome.becomeFirstResponder()
    }
    
    
}

