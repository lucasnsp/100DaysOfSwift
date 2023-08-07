//
//  Card.swift
//  Memory Match
//
//  Created by Lucas Neves dos santos pompeu on 07/08/23.
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
