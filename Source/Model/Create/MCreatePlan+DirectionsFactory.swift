import MapKit

extension MCreatePlan
{
    //MARK: private
    
    private func factoryRequest(travel:DPlanTravel) -> MKDirectionsRequest?
    {
        guard
            
            let origin:DPlanStop = travel.origin,
            let destination:DPlanStop = travel.destination
            
        else
        {
            return nil
        }
        
        let itemOrigin:MKMapItem = factoryMapItem(stop:origin)
        let itemDestination:MKMapItem = factoryMapItem(stop:destination)
        let transportType:MKDirectionsTransportType = travel.mode.factoryTransportType()
        
        let request:MKDirectionsRequest = MKDirectionsRequest()
        request.source = itemOrigin
        request.destination = itemDestination
        request.transportType = transportType
        
        return request
    }
    
    private func factoryMapItem(stop:DPlanStop) -> MKMapItem
    {
        let placemark:MKPlacemark = MKPlacemark(
            coordinate:stop.coordinate,
            addressDictionary:nil)
        
        let mapItem:MKMapItem = MKMapItem(placemark:placemark)
        
        return mapItem
    }
    
    //MARK: internal
    
    func factoryDirections(travel:DPlanTravel) -> MKDirections?
    {
        guard
            
            let request:MKDirectionsRequest = factoryRequest(travel:travel)
            
        else
        {
            return nil
        }
        
        let directions:MKDirections = MKDirections(request:request)
        
        return directions
    }
}
