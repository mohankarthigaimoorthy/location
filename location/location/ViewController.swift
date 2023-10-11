//
//  ViewController.swift
//  location
//
//  Created by Imcrinox Mac on 12/12/1444 AH.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {

    @IBOutlet weak var lablLocation: UILabel!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func locationBtndidTap(_ sender: Any) {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
}

