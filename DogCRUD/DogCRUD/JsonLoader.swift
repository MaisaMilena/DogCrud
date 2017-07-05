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
    
    public func carregarConteudoDaUrl(url:String){
   
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

}
