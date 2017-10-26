import MapKit

extension MKPolyline
{
    var locations:[CLLocation]
    {
        get
        {
            let locationList:[CLLocation] = factoryLocations()
            
            return locationList
        }
    }
    
    convenience init(locations:[CLLocation])
    {
        let coordinates:[CLLocationCoordinate2D] = MKPolyline.factoryCoordinates(
            locations:locations)
        let count:Int = coordinates.count
            
        self.init(
            coordinates:coordinates,
            count:count)
    }
    
    //MARK: private
    
    private class func factoryCoordinates(
        locations:[CLLocation]) -> [CLLocationCoordinate2D]
    {
        var coordinates:[CLLocationCoordinate2D] = []
        
        for location:CLLocation in locations
        {
            let coordinate:CLLocationCoordinate2D = location.coordinate
            coordinates.append(coordinate)
        }
        
        return coordinates
    }
    
    private func factoryLocations() -> [CLLocation]
    {
        var locations:[CLLocation] = []
        let pointer:UnsafeMutablePointer<CLLocationCoordinate2D> = UnsafeMutablePointer<CLLocationCoordinate2D>.allocate(
            capacity:pointCount)
        
        let range:NSRange = NSMakeRange(0, pointCount)
        getCoordinates(pointer, range:range)
        
        for index:Int in 0 ..< pointCount
        {
            let coordinate:CLLocationCoordinate2D = pointer[index]
            let location:CLLocation = CLLocation(
                latitude:coordinate.latitude,
                longitude:coordinate.longitude)
            
            locations.append(location)
        }
        
        return locations
    }
}
