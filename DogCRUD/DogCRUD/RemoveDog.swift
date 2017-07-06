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

class RemoveDog: NSObject, JsonLoaderDelegate {
    
    var url = "http://localhost:3000/dogs/delete?"
    
    var delegate: RemoveDogPresenterDelegate?
    let loader: JsonLoader = JsonLoader()
    
    
    override init() {
        
        super.init()
        loader.delegate = self

    }
    
    public func removeDog(id: String){
        
        url.append(id)
        
        print("🦋 Url de requisição: \(url)")
        // Faz a requisição para a classe JsonLoader que chama o webservice
        loader.carregarConteudoDaUrl(url: url, parameters: id, method: .delete)
    }
    
    // MARK: - Funções do JsonLoader
    
    /**
     Passar esse método adiante significa sucesso
    */
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]) {
        self.delegate?.removeDogConcluido()
    }
    
    /**
     Repassar a mensagem de erro adiante
     */
    func loaderJsonFalhou(mensagem: String) {
        self.delegate?.removeDogFalhou(erro: mensagem)
    }
}
