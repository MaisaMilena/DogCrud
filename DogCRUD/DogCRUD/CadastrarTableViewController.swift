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
        
       //insert.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func insertDogConcluido() {
        print("Inseret do dog concluido")
//        let alert = UIAlertController(title: "", message: "Cadastro realizado com sucesso!", preferredStyle: .actionSheet)
//        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { action in
//            self.performSegue(withIdentifier: "cadastrarHomeSegue", sender: nil)
//        }))
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
       
        if nome.text != "" && cor.text != "" {
            
            print("Entrou no cadastrarAction para textos diferente de nil: \(nome.text!) e \(cor.text!)")
            let dog = Dog()
            dog.id = ""
            dog.name = nome.text!
            dog.color = cor.text!
            
            print("Dog: nome \(dog.name) e cor \(dog.color)")
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
        if segue.identifier == "cadastrarHomeSegue"{
            segue.destination as! HomeViewController

        }
    }
    

}
