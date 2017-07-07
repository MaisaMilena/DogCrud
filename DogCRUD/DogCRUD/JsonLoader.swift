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
    /**
     Passar esse método adiante significa sucesso
     */
    func loaderJsonConcluido(arrayDicionario: [NSDictionary])
    
    /**
     Repassar a mensagem de erro adiante
     */
    func loaderJsonFalhou(mensagem: String)
}

class JsonLoader: NSObject {
    
    //MARK:- Delegate
    var delegate :JsonLoaderDelegate?
    
    public func carregarConteudoDaUrl(url:String, parameters: [String], method: HTTPMethod){
   
        switch method {
            case .get:
                getDogs(url: url)
            break
            case .delete:
                deleteDog(url: url, parameters: parameters)
            break
            case .post:
                postDog(url: url, parameters: parameters)
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
    /**
     Método para deleção de registros no servidor
     - parameter url: url do servidor
     - parameter parameters: id do registro a ser deletado
     */
    private func deleteDog(url: String, parameters: [String]){
        // Para deletar usa-se somente um parâmetro que é o id
        let param: Parameters = ["id" : parameters[0]]
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
    
    /**
     O método POST é usado tanto para criação quanto para atualização de registros, a diferença entre eles é determinado pela quantidade de parâmatros passados.
     A ordem dos parâmetros é relevante, sendo ela: id, name, color
     - parameter url: url do servidor 
     - parameter parameters: se inserção usar a ordem (name, color), se atualização usar (id, name, color)
     */
    private func postDog(url: String, parameters: [String]){
        // a ordem dos parâmetros é relevante
        var param: Parameters
        if parameters.count == 3{
            param = ["id":parameters[0],"name":parameters[1], "color":parameters[2]]
        } else {
            param = ["name":parameters[0], "color":parameters[1]]
        }
        
        Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: nil).responseString{
            (response) in
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

















