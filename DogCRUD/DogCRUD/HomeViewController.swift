//
//  HomeViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 05/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var listarButton: UIButton!
    @IBOutlet weak var cadastrarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Deixar os botões arredondados
        listarButton.layer.cornerRadius = listarButton.frame.height/2
        cadastrarButton.layer.cornerRadius = listarButton.frame.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func listarAction(_ sender: UIButton) {
        performSegue(withIdentifier: "homeListarSegue", sender: nil)
    }

    @IBAction func cadastrarAction(_ sender: UIButton) {
        performSegue(withIdentifier: "homeCadastrarSegue", sender: nil)
    }
    
    // MARK: - Navegação

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "homeListarSegue" {
            segue.destination as! ListarTableViewController
        } else {
            segue.destination as! CadastrarTableViewController
        }
    }
    

}
