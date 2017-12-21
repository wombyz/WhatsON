//
//  MapVC.swift
//  WhatsON
//
//  Created by Liam Ottley on 13/12/17.
//  Copyright © 2017 Liam Ottley. All rights reserved.
//

import UIKit
import FirebaseDatabase
import MapKit

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    var geoFire: GeoFire!
    var geoFireRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        geoFireRef = Database.database().reference()
        geoFire = GeoFire(firebaseRef: geoFireRef)
        
    }

    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
}
