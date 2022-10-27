//
//  NuevoController.swift
//  PracticaContactos
//
//  Created by Alumno on 10/25/22.
//  Copyright © 2022 Estudiate. All rights reserved.
//

import UIKit

class NuevoController : UIViewController {
    
    var contacto: Contacto?
    var callBackNuevo: ((Contacto) -> Void)?
     
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtTel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doTapNuevo(_ sender: Any) {
        if callBackNuevo != nil {
            contacto = Contacto(nombre: txtNombre.text ?? "nombre", tel: txtTel.text ?? "tel")
            callBackNuevo!(contacto!)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
