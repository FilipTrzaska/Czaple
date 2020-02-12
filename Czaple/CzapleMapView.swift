//
//  CzapleMapView.swift
//  Czaple
//
//  Created by Filip Trzaska on 09/04/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit
import MapKit

class CzapleMapView: ViewController, CLLocationManagerDelegate {
    var window: UIWindow?
    var mapView: MKMapView?
    var locationManager: CLLocationManager?
    var attractionProvider: AttractionProviderProtocol
    var other = [Attraction]()
    
    let visibleRadius: Double = 50
    
    let czapleTitle: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "title"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    init(attractionProvider: AttractionProviderProtocol) {
        self.attractionProvider = attractionProvider
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mapa Czapli"
        
        window = UIWindow(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: (window?.frame.size.width)!, height: (window?.frame.size.height)!))
        view.addSubview(mapView!)
        mapView?.mapType = .satellite
        
        
        mapView?.addSubview(czapleTitle)
        logoLayout()
        
        otherAttractions()
        addAnnotations()
        
        setupLocationManager()
        centerInCzapleHearth()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let mapView = mapView {
            let region = MKCoordinateRegion(center: locations.first!.coordinate, latitudinalMeters: self.visibleRadius, longitudinalMeters: self.visibleRadius)
            
            mapView.setRegion(region, animated: true)
            mapView.showsUserLocation = true
            
        }
    }
    
    func centerInCzapleHearth() {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.13483744619721, longitude: 15.74990784072876), span: MKCoordinateSpan(latitudeDelta: 0.034, longitudeDelta: 0.034))
        mapView?.setRegion(region, animated: true)
    }
    
    func setupLocationManager() {
        if let locationManager = locationManager {
            locationManager.delegate = self
            locationManager.desiredAccuracy =  kCLLocationAccuracyBestForNavigation
            locationManager.requestWhenInUseAuthorization()
            locationManager.distanceFilter = 5
            locationManager.startUpdatingLocation()
        }
    }
    
    func addAnnotations() {
        for attraction in other {
            let attractionPoint = MKPointAnnotation()
            attractionPoint.title = attraction.name
            attractionPoint.coordinate = attraction.coordinate!
            mapView!.addAnnotation(attractionPoint)
        }
        
        for attraction in attractionProvider.getAttractions() {
            if attraction.coordinate != nil {
                let attractionPoint = MKPointAnnotation()
                attractionPoint.title = attraction.name
                attractionPoint.coordinate = attraction.coordinate!
                mapView!.addAnnotation(attractionPoint)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func otherAttractions() {
        other.append(Attraction(
            name: "Żwirownia",
            coordinate: CLLocationCoordinate2D(latitude: 51.13202328636846, longitude: 15.735554695129395)
        ))
        other.append(Attraction(
            name: "Kościół",
            coordinate: CLLocationCoordinate2D(latitude: 51.13292545197658, longitude: 15.745253562927246)
        ))
        other.append(Attraction(
            name: "Kamienna Ściana",
            coordinate: CLLocationCoordinate2D(latitude: 51.14246443803983, longitude: 15.752828121185303)
        ))
        other.append(Attraction(
            name: "Kamieniołom",
            coordinate: CLLocationCoordinate2D(latitude: 51.14360198373563, longitude: 15.762720108032227)
        ))
        other.append(Attraction(
            name: "Punkt widokowy na Pogórze Kaczawskie",
            coordinate: CLLocationCoordinate2D(latitude: 51.13897085324201, longitude: 15.765337944030762)
        ))
    }
    
    func logoLayout() {
        NSLayoutConstraint.activate([
            czapleTitle.rightAnchor.constraint(equalTo: (mapView?.safeAreaLayoutGuide.rightAnchor)!),
            czapleTitle.bottomAnchor.constraint(equalTo: (mapView?.safeAreaLayoutGuide.bottomAnchor)!, constant: -20),
            czapleTitle.heightAnchor.constraint(equalToConstant: 30),
            czapleTitle.widthAnchor.constraint(equalToConstant: 99)
            ])
    }
}
