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
    
    override init() {
        print("🎈Entrou no JSONLoader")
    }
    
    public func carregarConteudoDaUrl(url:String){
        print("🎈Entrou no Carregar URL")
        Alamofire.request(url, method: .get).responseJSON { response in
            
            switch response.result {
            case .success:
                self.arrayDadosJSON = response.result.value as! [NSDictionary]
                //print(self.arrayDadosJSON)
                break
            case .failure(let error):
                print(error)
                break
            }
            print("🎻")
            print(self.arrayDadosJSON)
            self.delegate?.loaderJsonConcluido(arrayDicionario: self.arrayDadosJSON!)
        }
        
        print("🎻🎻")
        print(self.arrayDadosJSON)
    }

}
