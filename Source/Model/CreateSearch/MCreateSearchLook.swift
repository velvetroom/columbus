import MapKit

extension MCreateSearch
{
    //MARK: private
    
    private func asyncSearchPlace(
        place:String)
    {
        guard
        
            place.count > 0
        
        else
        {
            return
        }
        
        let search:MKLocalSearch = factorySearch(place:place)
        
        search.start
        { [weak self] (response:MKLocalSearchResponse?, error:Error?) in
         
            self?.searchPlace(
                response:response,
                error:error)
        }
    }
    
    private func searchPlace(
        response:MKLocalSearchResponse?,
        error:Error?)
    {
        guard
        
            error == nil,
            let mapItems:[MKMapItem] = response?.mapItems,
            mapItems.count > 0
        
        else
        {
            return
        }
        
        searchPlace(mapItems:mapItems)
    }
    
    private func searchPlace(
        mapItems:[MKMapItem])
    {
        for mapItem:MKMapItem in mapItems
        {
            
        }
    }
    
    //MARK: internal
    
    func searchPlace(place:String)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSearchPlace(place:place)
        }
    }
}
