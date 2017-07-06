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
    var delete: RemoveDog?
    
    var idDogAtualizacao = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loader = DogPresenter()
        loader?.delegate = self
        
        delete = RemoveDog()
        delete?.delegate = self
        
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
//        
//        for dog in dogs{
//            print (dog.name)
//        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadDogsFalhou(mensagem: String){
        print(mensagem)
    }
    
    // MARK: - Data source
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
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        
        if editingStyle == .delete {
            
            let id = dogs[indexPath.row].id
            
            dogs.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            print("🦄 Id do dog a ser removido: \(id)")
            self.delete?.removeDog(id: String(id))
        } 
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let proximaView = segue.destination as! AtualizarTableViewController
        proximaView.idDog = idDogAtualizacao
    }
    

}
// MARK: - Remove dog
extension ListarTableViewController: RemoveDogPresenterDelegate {
    
    /** Atualiza a table view
     */
    func removeDogConcluido(){
        self.tableView.reloadData()
        
    }
    
    func removeDogFalhou(erro: String){
        print(erro)
    }

    
}
