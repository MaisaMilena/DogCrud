//
//  DogLoader.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

protocol LoadDogDelegate{
    func LoadDogsConcluido(dogs: Array<Dog>)
}

class DogLoader: NSObject, JsonLoaderDelegate {
    
    let url = "http://localhost:3000/dogs"
    
    var delegate: LoadDogDelegate?
    let loader: JsonLoader = JsonLoader()
    
    
    func carregarDadosDog() {
        
        loader.delegate = self
        loader.carregarConteudoDaUrl(url: url)
    }
    
    /*
     Assim que o JsonLoader terminou de carregar os dados eles são enviados no parâmetro dessa função
     */
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]){
        tratarJson(arrayDicionario: arrayDicionario)
    }
    
    /**
     Responsável pelo tratamento adequado dos dados vindos do servidor
     - param : array de dicionario de Dog
     */
    private func tratarJson(arrayDicionario: [NSDictionary]){
        print("Entrou no Tratar Json")
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
        // Depois que a função terminou de executa ela transmite esses dados tratados para uma outra classe
        self.delegate?.LoadDogsConcluido(dogs: dogs)
    }
    
    
}
