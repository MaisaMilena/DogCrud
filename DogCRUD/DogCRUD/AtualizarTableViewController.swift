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
//    override func viewDidLoad() {
//        //super.viewDidLoad()
//        print("🐝🐝 Dog de atualização: \(dog.id)")
//        nome.text = dog.name
//        cor.text = dog.color
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("🐝🐝 Dog de atualização: \(dog.id)")
        nome.text = dog.name
        cor.text = dog.color
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
            let dogAtualizacao = Dog()
            dogAtualizacao.id = String(dog.id)
            dogAtualizacao.name = nome.text!
            dogAtualizacao.color = nome.text!
            
            print("Dog: id: \(dogAtualizacao.id) nome \(dogAtualizacao.name) e cor \(dogAtualizacao.color)")
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
