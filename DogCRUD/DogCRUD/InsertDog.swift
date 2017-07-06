//
//  InsertDog.swift
//  DogCRUD
//
//  Created by Maisa Milena on 06/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

protocol InsertDogPresenterDelegate {
    func insertDogConcluido()
    func insertDogFalhou(erro: String)
}


class InsertDog: NSObject, JsonLoaderDelegate {

    var url = "http://localhost:3000/dogs/insert?"
    
    // MARK: - Variável de delegate
    var delegate: InsertDogPresenterDelegate?
    let loader: JsonLoader = JsonLoader()
    
    // MARK:  - Funções
    override init() {
        
        super.init()
        loader.delegate = self
    }

    public func insertDog(dog: Dog){
        // a ordem dos parâmetros é relevante
        let param = [dog.name, dog.color]
        
//        var parameteres = "name="+dog.name
//
//        parameteres = parameteres.appending("&color="+dog.color)
       // url = url.appending(parameteres)
        // Faz a requisição para a classe JsonLoader que chama o webservice
        loader.carregarConteudoDaUrl(url: url, parameters: param, method: .post)
    }
    
    // MARK: - Funções do JsonLoader
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]) {
        self.delegate?.insertDogConcluido()
    }
    
    func loaderJsonFalhou(mensagem: String) {
        self.delegate?.insertDogFalhou(erro: mensagem)
    }
    
}
