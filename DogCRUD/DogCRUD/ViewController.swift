//
//  ViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    let urlInsert = "http://localhost:3000/dogs"
    
    // Array de dicionário
    var arrayDadosJSON : [NSDictionary] = [NSDictionary]()
    
    var dogs = Array<Dog>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Determinando o parâmetro passado na url
        //let parameters:Parameters = ["name": "dog do xcode", "color":"blue"]
        
      selectAllDogs()
        
        print("🐝 Terminou o tratamento JSON")
        print(self.dogs)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func selectAllDogs(){
        
        print("Entrou no select All Dogs")
        
        Alamofire.request(urlInsert, method: .get).responseJSON { response in
            
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
            self.setDogsList()
        }

        print("🎻🎻")
        print(self.arrayDadosJSON)
    
    }
    
    
    /*
     Transforma o array de dicionariosJSON em um array de objetos Dog
     */
    func setDogsList(){
        print("Entrou no set Dog")
        var dogs = Array<Dog>()
        
        print(arrayDadosJSON)
        
        for dado in arrayDadosJSON{
            let id = dado.object(forKey: "id")
            let name = dado.object(forKey: "name")
            let color = dado.object(forKey: "color")
            
            let dog = Dog(id: id as! Int64)
            dog.name = name as! String
            dog.color = color as! String
            
            dogs.append(dog)
        }
        self.dogs = dogs
    }
    
    

}

