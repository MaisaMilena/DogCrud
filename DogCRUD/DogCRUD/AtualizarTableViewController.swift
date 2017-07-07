//
//  AtualizarTableViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 05/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class AtualizarTableViewController: UITableViewController, InsertDogPresenterDelegate {
    
    var idDog: Int!
    
    // MARK: - IBOutlets

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var cor: UITextField!
    @IBOutlet weak var atualizarButton: UIButton!

    
    // MARK: - Presenter
    var atualizar: InsertDog = InsertDog()
    
    // MARK: - Funções
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    // MARK: - Funções do JsonLoader
    func insertDogConcluido() {
        print("Atualização do dog concluido")
        //        let alert = UIAlertController(title: "", message: "Cadastro realizado com sucesso!", preferredStyle: .actionSheet)
        //        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
        //            self.performSegue(withIdentifier: "cadastrarHomeSegue", sender: nil)
        //        }))
    }
    
    func insertDogFalhou(erro: String) {
        print(erro)
    }
    
    // MARK: - Ações de botões
    @IBAction func atualizarAction(_ sender: UIButton) {
        
        if nome.text != "" && cor.text != "" {
            let dog = Dog()
            dog.id = String(idDog)
            dog.name = nome.text!
            dog.color = nome.text!
            
            print("Dog: nome \(dog.name) e cor \(dog.color)")
            atualizar.insertDog(dog: dog)
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
