//
//  Dog.swift
//  DogCRUD
//
//  Created by Maisa Milena on 04/07/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit

class Dog: NSObject {
    
    let id: Int64
    var name:String = ""
    var color:String = ""
    
    required init(id: Int64) {
        self.id = id
    }
    
}
