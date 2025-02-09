//
//  TableViewController.swift
//  Aula2
//
//  Created by Sarah Ferreira Mendes da Cunha on 04/12/2018.
//  Copyright © 2018 Sarah Ferreira Mendes da Cunha. All rights reserved.
//

import UIKit

protocol RefreshTableView{
    func refresh()
}

class TableViewController: UITableViewController, RefreshTableView {
    let app = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    
    override func viewDidAppear(_ animated: Bool) {
        // Para atualizar a view depois de inserir um contacto (não é garantido que trabalhe sempre bem)
        super.viewDidAppear(animated)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // Devolver o número de elementos a construir/mostrar
        return app.lstContactos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemContacto", for: indexPath)
        
        // Configure the cell...
        
        // let section = indexPath.section // não é preciso porque só temos uma secção
        
        // Ir buscar a linha do contacto respetiva e preencher a cell
        let row = indexPath.row
        
        cell.textLabel?.text = app.lstContactos[row].nome
        cell.detailTextLabel?.text = app.lstContactos[row].email
        
        return cell
    }
    
    func refresh() {
        tableView.reloadData()
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            app.lstContactos.remove(at: indexPath.row)
            // Apagar da vista
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let row_orig = fromIndexPath.row
        let row_dest = to.row
        
        let contact = app.lstContactos.remove(at: row_orig)
        app.lstContactos.insert(contact, at: row_dest)
    }
    
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    var selected = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = indexPath.row
        
        // Opção 1
//        let contact = app.lstContactos[selected]
//        let vc = ViewController()
//        vc.contactoSelecionado = contact
//        navigationController?.show(vc, sender: self)
        
        // Opção 2
        performSegue(withIdentifier: "addContacto", sender: tableView)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        // Se corresponde ao segue que vai da table view para o outro view controller
        if segue.identifier == "addContacto" {
            let vc = segue.destination as! ViewController
            vc.delegate = self
            if sender is UITableView {
                vc.contactoSelecionado = app.lstContactos[selected]
            }
        }
    }
    
    
}
