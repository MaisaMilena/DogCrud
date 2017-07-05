//
//  DogPresenter.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

protocol LoadDogPresenterDelegate{
    func loadDogsConcluido(dogs: Array<Dog>)
    func loadDogsFalhou(mensagem: String)
}

class DogPresenter: NSObject, JsonLoaderDelegate {
   

    
    let url = "http://localhost:3000/dogs"
    
    var delegate: LoadDogPresenterDelegate?
    let loader: JsonLoader = JsonLoader()
    
    override init() {
        
        super.init()
        loader.delegate = self
        loader.carregarConteudoDaUrl(url: url)
        
    }

    // MARK: - Funções do Presenter
    /*
     Assim que o JsonLoader terminou de carregar os dados eles são enviados no parâmetro dessa função
     */
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]){
       // print("DogPresenter JsonConcluido")
        let dogs = tratarJson(arrayDicionario: arrayDicionario)
        // Transmite esses dados tratados para uma outra classe
        self.delegate?.loadDogsConcluido(dogs: dogs)
//        for dog in dogs{
//            print (dog.name)
//        }
    }
    
    func loaderJsonFalhou(mensagem: String) {
        self.delegate?.loadDogsFalhou(mensagem: mensagem)
    }
    

    // MARK: - Tratar dados
    /**
     Responsável pelo tratamento adequado dos dados vindos do servidor
     - param : array de dicionario de Dog
     */
    private func tratarJson(arrayDicionario: [NSDictionary]) -> Array<Dog>{
      
        var dogs = Array<Dog>()
        
        for dado in arrayDicionario{
            let id = dado.object(forKey: "id")
            let name = dado.object(forKey: "name")
            let color = dado.object(forKey: "color")
            
            let dog = Dog(id: id as! Int64)
            dog.name = name as! String
            dog.color = color as! String
            
            dogs.append(dog)
        }
        
        return dogs
    }
    
    
}
