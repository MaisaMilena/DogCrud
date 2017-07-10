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
/**
    Classe responsável pela inserção e atualização de Dogs
 */
class InsertDog: NSObject, JsonLoaderDelegate {
    /// URL no servidor para inserir novos registros
    let urlInsert = "http://18.231.84.7:3000/dogs/insert?"
    /// URL no servidor para atualizar um registro já existente
    let urlUpdate = "http://18.231.84.7:3000/dogs/update?"
    
    // MARK: - Variável de delegate
    var delegate: InsertDogPresenterDelegate?
    let loader: JsonLoader = JsonLoader()
    
    // MARK:  - Funções
    override init() {
        
        super.init()
        loader.delegate = self
    }
    /**
     Função chamada na ViewController para fazer a inserção ou atualização de um Dog
     - parameter dog: instância de Dog que será enviado ao servido
     */
    public func insertDog(dog: Dog){
        // a ordem dos parâmetros é relevante
        var param = [String]()
        if !dog.id.isEmpty {
            // atualiza Dog
            param = [dog.id, dog.name, dog.color]
            // Faz a requisição para a classe JsonLoader que chama o webservice
            loader.carregarConteudoDaUrl(url: urlUpdate, parameters: param, method: .post)
        } else {
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
