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
}

class JsonLoader: NSObject {
    
    //MARK:- Delegate
    var delegate :JsonLoaderDelegate?
    
    // MARK: - Dados carregados
    var arrayDadosJSON : [NSDictionary]?
    
    public func carregarConteudoDaUrl(url:String){
   
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result {
            case .success:
                self.arrayDadosJSON = response.result.value as! [NSDictionary]
                break
            case .failure(let error):
                print("🦊")
                print(error)
                break
            }

            if self.arrayDadosJSON == nil {
                print("🦊 Algum erro ocorreu, verifique o status do servidor")
            } else {
                self.delegate?.loaderJsonConcluido(arrayDicionario: self.arrayDadosJSON!)
            }
            
        }

    }

}
