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
    
    // Array de dicionários
    var dogs : [[String: AnyObject]] = [[String: AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Determinando o parâmetro passado na url
        //let parameters:Parameters = ["name": "dog do xcode", "color":"blue"]
        
      selectAllDogs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func selectAllDogs(){
        Alamofire.request(urlInsert, method: .get).responseJSON { (response) in
            
            switch response.result {
            case .success:
                self.dogs = response.result.value as! [[String: AnyObject]]
                print(self.dogs)
                break
            case .failure(let error):
                print(error)
                break
            }
            
        }
    }
    

}

