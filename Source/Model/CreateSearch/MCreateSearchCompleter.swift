import MapKit

extension MCreateSearch
{
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
}
