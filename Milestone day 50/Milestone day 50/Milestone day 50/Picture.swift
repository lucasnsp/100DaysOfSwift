//
//  Picture.swift
//  Milestone day 50
//
//  Created by Lucas Neves dos santos pompeu on 06/06/23.
//

import Foundation

class Picture: Codable {
    var imageName: String
    var caption: String
    
    init(imageName: String, caption: String) {
        self.imageName = imageName
        self.caption = caption
    }
}
