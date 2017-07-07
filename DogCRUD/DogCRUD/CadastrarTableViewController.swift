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
    
    // MARK: - Variáveis de delegate
    var insert: InsertDog = InsertDog()
    
    // MARK: - Funções
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(cadastarAction))
 
       insert.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Funções do JsonLoader
    func insertDogConcluido() {
        let alert = UIAlertController(title: "", message: "Cadastro realizado com sucesso!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
            self.performSegue(withIdentifier: "cadastrarHomeSegue", sender: nil)
        }))
        
        self.present(alert, animated: true, completion:nil)
          }
    
    func insertDogFalhou(erro: String) {
        print(erro)
    }
    
    

    // MARK: - Table view data source

    /*
     O número 4 é porque tem 4 células (imagem, nome, cor e cadastrar)
     */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

   func cadastarAction() {
       
        if nome.text != "" && cor.text != "" {
        
            let dog = Dog()
            dog.id = ""
            dog.name = nome.text!
            dog.color = cor.text!

            insert.insertDog(dog: dog)
        } else {
            
            if nome.text == "" {
                nome.placeholder = "O nome não pode ser vazio"
                nome.textColor = UIColor.red
            }
        
            if cor.text == "" {
                cor.placeholder = "A cor não pode ser vazia"
                cor.textColor = UIColor.red
            }
        }
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination as! HomeViewController
    }
    

}
