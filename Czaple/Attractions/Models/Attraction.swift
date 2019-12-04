//
//  Attraction.swift
//  Czaple
//
//  Created by Filip Trzaska on 08/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import Foundation
import MapKit

struct Attraction {
    let name: String?
    let title: String?
    let body: String?
    let coordinate: CLLocationCoordinate2D?
    
    init(name: String? = nil, title: String? = nil, body: String? = nil, coordinate: CLLocationCoordinate2D? = nil) {
        self.name = name
        self.title = title
        self.body = body
        self.coordinate = coordinate
    }
}
