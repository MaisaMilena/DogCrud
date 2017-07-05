//
//  JsonLoader.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import Alamofire

//Delegate protocol
protocol JsonLoaderDelegate{
    func loaderJsonConcluido(arrayDicionario: [NSDictionary])
    func loaderJsonFalhou(mensagem: String)
}

protocol JsonDelegateRemove{
    func removeConcluido()
    func removeFalhou(mensagem: String)
}

class JsonLoader: NSObject {
    
    //MARK:- Delegate
    var getDelegate :JsonLoaderDelegate?
    
    var removeDelegate: JsonDelegateRemove?
    
    public func carregarConteudoDaUrl(url:String){
   
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result {
            case .success:
                let arrayDadosJSON = response.result.value as! [NSDictionary]
                self.getDelegate?.loaderJsonConcluido(arrayDicionario: arrayDadosJSON)
                break
            case .failure(let error):
                self.getDelegate?.loaderJsonFalhou(mensagem: "🦊 Algum erro ocorreu, verifique o status do servidor: \(error)")
                break
            }
        }

    }
    
    public func deletarDogById(url: String, id: String){
        Alamofire.request(url, method: .post).responseJSON { response in
            
            switch response.result {
            case .success:
                self.removeDelegate?.removeConcluido()
                break
            case .failure(let error):
                self.removeDelegate?.removeFalhou(mensagem: String(describing: error))
                break
            }
        }
    }

}
