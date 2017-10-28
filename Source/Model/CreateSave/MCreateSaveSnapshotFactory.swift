import MapKit

extension MCreateSave
{
    //MARK: internal
    
    class func factorySnapshotOptions(
        mapRange:MCreateSaveMapRange) -> [MKMapSnapshotOptions]
    {
        let mapRect:MKMapRect = mapRange.factoryMapRect()
        
        let option:MKMapSnapshotOptions = MKMapSnapshotOptions()
        option.mapRect = mapRect
        
        let options:[MKMapSnapshotOptions] = [
            option]
        
        return options
    }
}
