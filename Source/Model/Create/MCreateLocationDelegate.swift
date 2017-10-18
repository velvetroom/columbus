import Foundation
import CoreLocation

final class MCreateLocationDelegate:
    NSObject,
    CLLocationManagerDelegate
{
    weak var model:MCreate?
    var locationManager:CLLocationManager?
    private let kDistanceFilter:CLLocationDistance = 10
    
    //MARK: private
    
    private func createManager()
    {
        guard
            
            self.locationManager == nil
        
        else
        {
            return
        }
        
        let locationManager:CLLocationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kDistanceFilter
        locationManager.delegate = self
        self.locationManager = locationManager
    }
    
    //MARK: internal
    
    func askAuthorization()
    {
        createManager()
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func clean()
    {
        locationManager?.delegate = nil
        locationManager?.stopUpdatingLocation()
    }
    
    //MARK: locationManager delegate
    
    func locationManager(
        _ manager:CLLocationManager,
        didChangeAuthorization status:CLAuthorizationStatus)
    {
        guard
        
            status != CLAuthorizationStatus.notDetermined
        
        else
        {
            return
        }
        
        model?.checkAuthorization()
    }
}
