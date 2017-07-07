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

    let urlInsert = "http://localhost:3000/dogs/insert?"
    let urlUpdate = "http://localhost:3000/dogs/update?"
    
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
        var param = [String]()
        if !dog.id.isEmpty {
            print("🐮 Chegou no InsertDog para atualização")
            // atualiza Dog
            param = [dog.id, dog.name, dog.color]
            // Faz a requisição para a classe JsonLoader que chama o webservice
            loader.carregarConteudoDaUrl(url: urlUpdate, parameters: param, method: .post)
        } else {
            print("🐮 Chegou no InsertDog para criação")
            // cria Dog
            param = [dog.name, dog.color]
            // Faz a requisição para a classe JsonLoader que chama o webservice
            loader.carregarConteudoDaUrl(url: urlInsert, parameters: param, method: .post)
        }    
    }
    
    // MARK: - Funções do JsonLoader
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]) {
        self.delegate?.insertDogConcluido()
    }
    
    func loaderJsonFalhou(mensagem: String) {
        self.delegate?.insertDogFalhou(erro: mensagem)
    }
    
}
