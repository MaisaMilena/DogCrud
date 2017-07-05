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
    var dogPresenter: DogPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dogPresenter = DogPresenter()
        dogPresenter?.delegate = self
        
        
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: - Funções do Presenter
    func loadDogsConcluido(dogs: Array<Dog>) {
        self.dogs = dogs
        print("🐰 Chegou na view controller ")
        for dog in dogs{
            print(dog.id)
            print(dog.name)
            print(dog.color)
        }
    }
    
    func loadDogsFalhou(mensagem: String){
        print(mensagem)
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
