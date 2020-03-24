//
//  ViewController.swift
//  Grafico
//
//  Created by Cátia Souza on 24/03/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

  
    @IBOutlet weak var viewgrafico: BarChart!
    
    var tapGesture = UITapGestureRecognizer()
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf2: UITextField!
    
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf1: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


 
    
    
    @IBAction func atualizarGrafico(_ sender: Any) {
        var info1 = 0, info2 = 0, info3 = 0, info4 = 0, info5 = 0
        
        if !tf1.text!.isEmpty{
            info1 = Int(tf1.text!)!
        }
        if !tf2.text!.isEmpty{
            info2 = Int(tf2.text!)!
        }
        if !tf3.text!.isEmpty{
            info3 = Int(tf3.text!)!
        }
        if !tf4.text!.isEmpty{
            info4 = Int(tf4.text!)!
        }
        if !tf5.text!.isEmpty{
            info5 = Int(tf5.text!)!
        }
        
        viewgrafico.atualizar([info1,info2,info3,info4,info5])
    }
    
}

