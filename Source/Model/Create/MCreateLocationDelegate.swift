import Foundation
import CoreLocation

final class MCreateLocationDelegate:
    NSObject,
    CLLocationManagerDelegate
{
    weak var model:MCreate?
    var locationManager:CLLocationManager?
    
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
        locationManager.distanceFilter = MCreateLocationDelegate.Constants.distanceFilter
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
        
        model?.checkAuthorization(status:status)
    }
}
