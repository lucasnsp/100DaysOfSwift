//
//  Capital.swift
//  Project 16
//
//  Created by Lucas Neves dos santos pompeu on 19/06/23.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
