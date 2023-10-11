//
//  coreLocation.swift
//  location
//
//  Created by Imcrinox Mac on 12/12/1444 AH.
//

import Foundation
import CoreLocation

extension ViewController : CLLocationManagerDelegate {
    func loacationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.lablLocation.text = "Error while updating location" + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            guard error == nil else {
                self.lablLocation.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks!.first
                self.displayLocationInfo(pm)
            } else {
                self.lablLocation.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self.lablLocation.text = postalCode! + " " + locality!
            
            self.lablLocation.text?.append("\n" + administrativeArea! + ", " + country!)
        }
        
    }
}

