//
//  ViewController.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController, LoadDogDelegate {
 
    var dogs = Array<Dog>()
    var dogLoader : DogLoader?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Determinando o parâmetro passado na url
        //let parameters:Parameters = ["name": "dog do xcode", "color":"blue"]
        
        dogLoader = DogLoader()
        dogLoader?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func loadDogsConcluido(dogs: Array<Dog>) {
        self.dogs = dogs
        print("🐰 Chegou na view controller ")
        for dog in dogs{
            print(dog.id)
            print(dog.name)
            print(dog.color)
        }
    }

}

