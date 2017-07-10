//
//  DogPresenter.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

protocol LoadDogPresenterDelegate{
    /// Possui os dados sobre os Dogs no parâmetro
    func loadDogsConcluido(dogs: Array<Dog>)
    /// Repassa mensagem de erro recebida do servidor adiante
    func loadDogsFalhou(mensagem: String)
}
/**
    Classe responsável pelo recebimento dos dados em formato Json e transformação para um Array de Dogs, possibilitanto que a ViewController use esses dados
 */
class DogPresenter: NSObject, JsonLoaderDelegate {
    /// URL no servidor para receber dados sobre todos os dogs
    let url = "http://18.231.84.7:3000/dogs"
    
    // MARK: - Variável de delegate
    var delegate: LoadDogPresenterDelegate?
    let loader: JsonLoader = JsonLoader()
    
    // MARK:  - Funções
    override init() {
        
        super.init()
        loader.delegate = self
        // Faz a requisição para a classe JsonLoader que chama o webservice
        loader.carregarConteudoDaUrl(url: url, parameters: [""], method: .get)
        
    }

    // MARK: - Funções do JsonLoader
    /*
     Assim que o JsonLoader terminou de carregar os dados, estes são enviados para a próxima classe
     */
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]){
        let dogs = tratarJson(arrayDicionario: arrayDicionario)
        // Transmite esses dados tratados para uma outra classe
        self.delegate?.loadDogsConcluido(dogs: dogs)
        
    }
    
    func loaderJsonFalhou(mensagem: String) {
        self.delegate?.loadDogsFalhou(mensagem: mensagem)
    }
    

    // MARK: - Tratar dados
    /**
     Responsável pelo tratamento adequado dos dados vindos do servidor. Recebe um array de dicionário (formato JSON) e transforma-os em um array de dog
     - parameter arrayDicionario: array de dicionario com dados sobre Dog
     - returns: array de objetos Dog
     */
    private func tratarJson(arrayDicionario: [NSDictionary]) -> Array<Dog>{
      
        var dogs = Array<Dog>()
        
        for dado in arrayDicionario{
      
            let id = dado.object(forKey: "id")
            let name = dado.object(forKey: "name")
            let color = dado.object(forKey: "color")
            
            let idGambi = "\(id!)"
            
            let dog = Dog()
            dog.id = idGambi
            dog.name = name as! String
            dog.color = color as! String
            
            dogs.append(dog)
        }
        
        return dogs
    }
    
    
}
