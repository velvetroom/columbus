import Foundation
import CoreLocation

extension MCreatePlan
{
    //MARK: private
    
    private func startGeocoder()
    {
        guard
        
            self.geocoder == nil
        
        else
        {
            return
        }
        
        let geocoder:CLGeocoder = CLGeocoder()
        self.geocoder = geocoder
    }
    
    private func geocodeLocation(
        placemarks:[CLPlacemark]?,
        error:Error?,
        completion:((String?) -> ()))
    {
        guard
        
            error == nil,
            let placemark:CLPlacemark = placemarks?.first,
            let name:String = placemark.name
        
        else
        {
            completion(nil)
            
            return
        }
        
        completion(name)
    }
    
    //MARK: internal
    
    func geocodeLocation(
        location:CLLocation,
        completion:@escaping((String?) -> ()))
    {
        startGeocoder()
        
        geocoder?.reverseGeocodeLocation(location)
        { [weak self] (
            placemarks:[CLPlacemark]?,
            error:Error?) in
            
            self?.geocodeLocation(
                placemarks:placemarks,
                error:error,
                completion:completion)
        }
    }
}
