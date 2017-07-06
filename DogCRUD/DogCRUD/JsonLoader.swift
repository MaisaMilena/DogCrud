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

class JsonLoader: NSObject {
    
    //MARK:- Delegate
    var delegate :JsonLoaderDelegate?
    
    public func carregarConteudoDaUrl(url:String, parameters: String, method: HTTPMethod){
   
        switch method {
            case .get:
                getDogs(url: url)
            break
            case .delete:
                deleteDog(url: url, parameters: parameters)
            break
            default: break
            
        }
        
        
        
        

    }
    
    private func getDogs(url: String){
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result {
            case .success:
                let arrayDadosJSON = response.result.value as! [NSDictionary]
                self.delegate?.loaderJsonConcluido(arrayDicionario: arrayDadosJSON)
                break
            case .failure(let error):
                self.delegate?.loaderJsonFalhou(mensagem: "🦊 Algum erro ocorreu, verifique o status do servidor: \(error)")
                break
            }
        }
    }
    
    private func deleteDog(url: String, parameters: String){
        
        let param: Parameters = ["id" : parameters]
        Alamofire.request(url, method: .delete, parameters: param).responseString {
            response in
            
            switch response.result {
            case .success:
                self.delegate?.loaderJsonConcluido(arrayDicionario: [])
                break
            case .failure(let error):
                    self.delegate?.loaderJsonFalhou(mensagem: "🦊 Algum erro ocorreu, verifique o status do servidor: \(error)")
                break
            }
        }
    }
    

}
