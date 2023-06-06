//
//  Person.swift
//  Project 10
//
//  Created by Lucas Neves dos santos pompeu on 29/05/23.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
