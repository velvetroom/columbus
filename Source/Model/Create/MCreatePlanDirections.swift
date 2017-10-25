import MapKit

extension MCreatePlan
{
    //MARK: private
    
    private func factoryRequest(
        travel:DPlanTravel) -> MKDirectionsRequest?
    {
        guard
        
            let origin:DPlanStop = travel.origin,
            let destination:DPlanStop = travel.destination
        
        else
        {
            return nil
        }
        
        let itemOrigin:MKMapItem = factoryMapItem(
            stop:origin)
        let itemDestination:MKMapItem = factoryMapItem(
            stop:destination)
        
    }
    
    private func factoryMapItem(
        stop:DPlanStop) -> MKMapItem
    {
        let placemark:MKPlacemark = MKPlacemark(
            coordinate:stop.coordinate,
            addressDictionary:nil)
        let mapItem:MKMapItem = MKMapItem(
            placemark:placemark)
        
        return mapItem
    }
    
    //MARK: internal
    
    func directions(
        travel:DPlanTravel,
        completion:@escaping(() -> ()))
    {
        
    }
}
