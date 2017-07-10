//
//  RemoveDog.swift
//  DogCRUD
//
//  Created by Maisa Milena on 05/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

protocol RemoveDogPresenterDelegate {
    func removeDogConcluido()
    func removeDogFalhou(erro: String)
    
}
/**
    Classe responsável por fazer a chamada no servidor para que remova um determinado Dog
 */
class RemoveDog: NSObject, JsonLoaderDelegate {
    /// URL no servidor para solicitar a remoção de um Dog
    var url = "http://18.231.84.7:3000/dogs/delete?"
    
    // MARK: - Variável de delegate
    var delegate: RemoveDogPresenterDelegate?
    let loader: JsonLoader = JsonLoader()
    
    // MARK:  - Funções
    override init() {
        
        super.init()
        loader.delegate = self

    }
    
    /**
     Função chamada na ViewController para acionar a remoção do Dog
     - parameter id: id do Dog que será removido
     */
    public func removeDog(id: String){
        // passa o id do Dog na URL de requisição no servidor
        url.append(id)
        
        //print("🦋 Url de requisição: \(url)")
        // Faz a requisição para a classe JsonLoader que chama o webservice
        loader.carregarConteudoDaUrl(url: url, parameters: [id], method: .delete)
    }
    
    // MARK: - Funções do JsonLoader
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]) {
        self.delegate?.removeDogConcluido()
    }

    func loaderJsonFalhou(mensagem: String) {
        self.delegate?.removeDogFalhou(erro: mensagem)
    }
}
