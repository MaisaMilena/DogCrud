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
    
    let url = "http://localhost:3000"
    
    
    func loaderJsonConcluido(arrayDicionario: [NSDictionary]) {
        
    }
    
    func loaderJsonFalhou(mensagem: String) {
        <#code#>
    }
}
