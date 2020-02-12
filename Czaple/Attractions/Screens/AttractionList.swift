//
//  AttractionList.swift
//  Czaple
//
//  Created by Filip Trzaska on 04/08/2019.
//  Copyright © 2019 Filip Trzaska. All rights reserved.
//

import UIKit
import MapKit

class AttractionList: UITableViewController {
    
    private let attractionProvider = AttractionProvider()
    private let cellId = "attractionCell"
    private var locManager = CLLocationManager()
    private var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager.requestWhenInUseAuthorization()
        tableView.register(UINib(nibName: "AttractionCell", bundle: nil), forCellReuseIdentifier: cellId)
        tableView.separatorColor = .clear
        title = "Atrakcje Czapli"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        (CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() ==  .authorizedAlways) ?
            ( currentLocation = locManager.location ) : ( currentLocation = CLLocation(latitude: 0, longitude: 0) )
        navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attractionProvider.getAttractions().count - 1 // czaple as first will not be displayed
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AttractionCell
        
        let attraction = attractionProvider.getAttractions()[indexPath.row + 1]
        let distance = currentLocation.distance(from: CLLocation(latitude: attraction.coordinate!.latitude, longitude: attraction.coordinate!.longitude)) / 1000
        
        cell.photo.image = UIImage(named: attraction.name!)
        cell.title.text = attraction.name
        cell.distance.text = String(format:"%.2f", distance) + " km"
        cell.round.dropShadow()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let attractionVC = AttractionView()
        attractionVC.attraction = attractionProvider.getAttractions()[indexPath.row + 1]
        
        self.navigationController?.pushViewController(attractionVC, animated: true)
    }
    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
