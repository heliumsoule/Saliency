//
//  LocationViewController.swift
//  Tail
//
//  Created by Jing Lin on 11/4/16.
//  Copyright © 2016 Saliency. All rights reserved.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    
    var locationManager:CLLocationManager!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.allowsBackgroundLocationUpdates = true
        self.locationManager.activityType = .otherNavigation
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("There were new locations")
    }
    
}
