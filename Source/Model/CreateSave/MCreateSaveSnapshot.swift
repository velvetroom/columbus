import MapKit

extension MCreateSave
{
    //MARK: private
    
    private class func snapshots(
        dispatchGroup:DispatchGroup,
        options:[MKMapSnapshotOptions],
        completion:@escaping(([UIImage]) -> ()))
    {
        var images:[UIImage] = []
        
        for option:MKMapSnapshotOptions in options
        {
            dispatchGroup.enter()
            
            snapshot(option:option)
            { (image:UIImage?) in
                
                if let image:UIImage = image
                {
                    images.append(image)
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        {
            completion(images)
        }
    }
    
    private class func snapshot(
        option:MKMapSnapshotOptions,
        completion:@escaping((UIImage?) -> ()))
    {
        let snapshotter:MKMapSnapshotter = MKMapSnapshotter(
            options:option)
        
        snapshotter.start
        { (snapshot:MKMapSnapshot?, error:Error?) in
            
            guard
            
                error == nil,
                let image:UIImage = snapshot?.image
            
            else
            {
                completion(nil)
                
                return
            }
            
            completion(image)
        }
    }
    
    //MARK: internal
    
    class func snapshots(
        mapRange:MCreateSaveMapRange,
        settings:DSettings,
        completion:@escaping(([UIImage]) -> ()))
    {
        let options:[MKMapSnapshotOptions] = factorySnapshotOptions(
            mapRange:mapRange,
            settings:settings)
        let dispatchGroup:DispatchGroup = MCreateSave.factoryDispatchGroup()
        
        snapshots(
            dispatchGroup:dispatchGroup,
            options:options,
            completion:completion)
    }
}
