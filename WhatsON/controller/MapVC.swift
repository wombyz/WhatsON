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
    var event: Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        geoFireRef = Database.database().reference()
        geoFire = GeoFire(firebaseRef: geoFireRef)
        
    }

    @IBAction func unwindToThisViewController(segue: UIStoryboardSegue) {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //when the view appears do following checks to show location
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        //check if user has authorised then show their location, otherwise request permission
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // if the user has changed authorise status, then check for and show user loaction on the map
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    func centreMapOnLocation(location: CLLocation) {
        // centre the map on the users coordinate and select view size
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userlocation: MKUserLocation) {
        if let loc = userlocation.location {
            if !mapHasCenteredOnce {
                centreMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//
//        let annoIdentifier = "Event"
//        var annotationView: MKAnnotationView?
//
//        if annotation.isKind(of: MKUserLocation.self) {
//            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
//            annotationView?.image = UIImage(named: "ash")
//        } else if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier) {
//            annotationView = deqAnno
//            annotationView?.annotation = annotation
//        } else {
//            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
//            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//            annotationView = av
//        }
//
//        if let annotationView = annotationView, let anno = annotation as? PokeAnnotation {
//
//            annotationView.canShowCallout = true
//            annotationView.image = UIImage(named: "\(anno.pokemonNumber)")
//            let btn = UIButton()
//            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
//            btn.setImage(UIImage(named: "map"), for: .normal)
//            annotationView.rightCalloutAccessoryView = btn
//        }
//
//        return annotationView
//
//    }
//
}
