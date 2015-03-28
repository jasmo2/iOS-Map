//
//  ViewController.swift
//  LocationMap
//
//  Created by Jaime Molina Orbe on 3/21/15.
//  Copyright (c) 2015 jasmo2. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var manager:CLLocationManager!
    
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy - kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
 
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/
    
     func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        println("okokokokokokokok")
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        
        self.speedLabel.text = "\(userLocation.speed)"
        
        self.courseLabel.text = "\(userLocation.course)"
        
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {(placemarks,error) -> Void in
                if (error != nil){
                    
                   println(error)
                    
                }else{
                    
                    if let p = CLPlacemark(placemark: placemarks?[0] as CLPlacemark){
                     println(p)
                    }
            }
            })
    }

}

