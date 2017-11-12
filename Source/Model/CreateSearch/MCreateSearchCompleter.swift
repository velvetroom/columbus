import MapKit

extension MCreateSearch
{
    //MARK: internal
    
    func complete(string:String)
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.completer.queryFragment = string
        }
    }
}
