//
//  AtualizarTableViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 05/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class AtualizarTableViewController: UITableViewController, InsertDogPresenterDelegate {
    
    var dog = Dog()
    
    // MARK: - IBOutlets
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var cor: UITextField!

    // MARK: - Presenter
    var atualizar: InsertDog = InsertDog()
    
    // MARK: - Funções
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(atualizarAction))
        atualizar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nome.text = dog.name
        cor.text = dog.color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    // MARK: - Funções do JsonLoader
    func insertDogConcluido() {
        let alert = UIAlertController(title: "", message: "Atualização realizada com sucesso!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
            self.performSegue(withIdentifier: "atualizarHomeSegue", sender: nil)
        }))
        
        self.present(alert, animated: true, completion:nil)
    }
    
    func insertDogFalhou(erro: String) {
        print(erro)
    }
    
    // MARK: - Ações de botões
    func atualizarAction() {
        if nome.text != "" && cor.text != "" {
            let dogAtualizacao = Dog()
            dogAtualizacao.id = String(dog.id)
            dogAtualizacao.name = nome.text!
            dogAtualizacao.color = cor.text!
            
            atualizar.insertDog(dog: dogAtualizacao)
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
