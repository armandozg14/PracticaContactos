//
//  ViewController.swift
//  PracticaContactos
//
//  Created by Alumno on 10/20/22.
//  Copyright © 2022 Estudiate. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var contactos: [Contacto] = []
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaContacto") as! CeldaContactoController
        celda.lblNombre.text = contactos[indexPath.row].nombre
        celda.lblTel.text = contactos[indexPath.row].tel
        
        return celda
    }
    
    @IBOutlet weak var tvContactos: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactos.append(Contacto(nombre: "Azalia", tel: "6441154587"))
        contactos.append(Contacto(nombre: "Marisela", tel: "6441144560"))
        contactos.append(Contacto(nombre: "Armando", tel: "6441964592"))
        
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNuevo" {
            let destino = segue.destination as! NuevoController
            destino.callBackNuevo = nuevoContacto
        }
        
        if segue.identifier == "goToEditar" {
            let destino = segue.destination as! EditarController
            destino.contacto = contactos[tvContactos.indexPathForSelectedRow!.row]
            destino.callBackActualizar = actualizarContacto
        }
    }
    
    func nuevoContacto(contacto : Contacto) {
        contactos.append(contacto)
        tvContactos.reloadData()
    }
    
    func actualizarContacto(){
        tvContactos.reloadData()
    }


}

