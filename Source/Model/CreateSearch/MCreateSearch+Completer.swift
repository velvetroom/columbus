import MapKit

extension MCreateSearch
{
    //MARK: private
    
    private func asyncSearchItem(
        item:MKLocalSearchCompletion)
    {
        let searchRequest:MKLocalSearchRequest = MKLocalSearchRequest(
            completion:item)
        let search:MKLocalSearch = MKLocalSearch(
            request:searchRequest)
        
        search.start
        { [weak self] (response:MKLocalSearchResponse?, error:Error?) in
            
            self?.searchItem(
                response:response,
                error:error)
        }
    }
    
    private func searchItem(
        response:MKLocalSearchResponse?,
        error:Error?)
    {
        guard
            
            error == nil,
            let mapItems:[MKMapItem] = response?.mapItems,
            let firstItem:MKMapItem = mapItems.first
            
        else
        {
            return
        }
        
        let coordinate:CLLocationCoordinate2D = firstItem.placemark.coordinate
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.itemFound(coordinate:coordinate)
        }
    }
    
    private func itemFound(coordinate:CLLocationCoordinate2D)
    {
        guard
        
            let controller:CCreateSearch = view?.controller as? CCreateSearch
        
        else
        {
            return
        }
        
        controller.itemFound(coordinate:coordinate)
    }
    
    //MARK: internal
    
    func complete(string:String)
    {
        guard
            
            string.isEmpty
        
        else
        {
            completer.queryFragment = string
            
            return
        }
        
        completer.cancel()
        updateItems(items:[])
    }
    
    func searchItem(item:MKLocalSearchCompletion)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSearchItem(item:item)
        }
    }
}
