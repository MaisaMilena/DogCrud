//
//  CadastrarTableViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 05/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class CadastrarTableViewController: UITableViewController, InsertDogPresenterDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var cor: UITextField!
    
    @IBOutlet weak var cadastrarButton: UIButton!
    
    // MARK: - Variáveis de delegate
    var insert: InsertDog = InsertDog()
    
    // MARK: - Funções
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // arredondar o botão
        cadastrarButton.layer.cornerRadius = cadastrarButton.frame.height/2
        
        insert.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func insertDogConcluido() {
        
        
        to aqui
        
        
        let alert = UIAlertController(title: "", message: <#T##String?#>, preferredStyle: <#T##UIAlertControllerStyle#>)
    }
    
    func insertDogFalhou(erro: String) {
        print(erro)
    }
    
    

    // MARK: - Table view data source

    /*
     O número 4 é porque tem 4 células (imagem, nome, cor e cadastrar)
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    @IBAction func cadastarAction(_ sender: UIButton) {
        
        var dog = Dog()
        dog.id = ""
        dog.name = nome.text!
        dog.color = cor.text!
        
        insert.insertDog(dog: dog)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination as! HomeViewController
    }
    

}
