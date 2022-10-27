//
//  EditarController.swift
//  PracticaContactos
//
//  Created by Alumno on 10/25/22.
//  Copyright © 2022 Estudiate. All rights reserved.
//

import UIKit

class EditarController : UIViewController {
    
    var contacto : Contacto?
    
    var nombre: String?
    var tel: String?
    var callBackActualizar : (() -> Void)?
    
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if contacto != nil {
            txtNombre.text = contacto!.nombre
            txtTel.text = contacto!.tel
        }
        
    }
    
    @IBAction func doTapActualizar(_ sender: Any) {
        if callBackActualizar != nil {
            contacto?.nombre = txtNombre.text!
            contacto?.tel = txtTel.text!
            callBackActualizar!()
            self.navigationController?.popViewController(animated: true)
        }

    }
    
}
