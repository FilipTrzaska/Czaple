//
//  BoardGetter.swift
//  Czaple
//
//  Created by Filip Trzaska on 05/12/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import MapKit

class BoardGetter {
    static let instance = BoardGetter()
    
     func getTablice() -> [Attraction] {
         var tablice = [Attraction]()
         
         tablice.append(Attraction(
             name: AttractionManager.Tablica_nr1,
             title: "Mini centrum geologii lokalnej i początek ścieżki",
             coordinate: CLLocationCoordinate2D(latitude: 51.135347, longitude: 15.749667)
         ))
         
         tablice.append(Attraction(
             name: AttractionManager.Tablica_nr2,
             title: "Druga Tablica na ścieżce geologicznej",
             coordinate: CLLocationCoordinate2D(latitude: 51.140822, longitude: 15.748479)
         ))
         
         tablice.append(Attraction(
             name: AttractionManager.Tablica_nr3,
             title: "Szmaragdowe Oczko na zachodznich stokach Kopki",
             coordinate: CLLocationCoordinate2D(latitude: 51.14453, longitude: 15.74813)
         ))
         
         tablice.append(Attraction(
             name: AttractionManager.Tablica_nr4,
             title: "Kamieniołom",
             coordinate: CLLocationCoordinate2D(latitude: 51.14244, longitude: 15.75299)
         ))
         
         tablice.append(Attraction(
             name: AttractionManager.Tablica_nr5,
             title: "Wschodni wierzchołek Kopki",
             coordinate: CLLocationCoordinate2D(latitude: 51.14184, longitude: 15.76337)
         ))
         
         return tablice
     }
}
