//
//  ListarTableViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 05/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class ListarTableViewController: UITableViewController, LoadDogPresenterDelegate {

    var dogs = Array<Dog>()
    
    @IBOutlet var listaDeDogs: UITableView!
    
    var loader: DogPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader = DogPresenter()
        loader?.delegate = self
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    // Se o array estiver vazio retorna 1 célula, que será a de apresentar uma mensagem informando que não há dados para serem listados
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count == 0 ? 1 : dogs.count
    }
    
    // MARK: - Funções do Presenter
    
    /**
     Carregamento concluído com sucesso
     */
    func loadDogsConcluido(dogs: Array<Dog>) {
        self.dogs = dogs
        
        //print("Listar loadDogsConcluido")
        
        for dog in dogs{
            print (dog.name)
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadDogsFalhou(mensagem: String){
        print(mensagem)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.listaDeDogs.dequeueReusableCell(withIdentifier: "cell")!
        
        if dogs.count == 0 {
            cell.textLabel?.text = "Não há dados para serem apresentados"
        } else {
            cell.textLabel?.text = ""
            let dog = dogs[indexPath.row]
            
            let id = cell.viewWithTag(1) as! UILabel
            id.text = String(dog.id)
            
            let name = cell.viewWithTag(2) as! UILabel
            name.text = dog.name
            
            let color = cell.viewWithTag(3) as! UILabel
            color.text = dog.color
            
        }
        
        return cell
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
