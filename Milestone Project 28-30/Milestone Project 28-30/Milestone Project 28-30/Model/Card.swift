//
//  Card.swift
//  Milestone Project 28-30
//
//  Created by Lucas Neves dos santos pompeu on 05/08/23.
//

import Foundation
import UIKit

class Card {
    var name: String
    var isFlipped: Bool = false
    var isMatch: Bool = false
    
    init(name: String) {
        self.name = name
    }
}
