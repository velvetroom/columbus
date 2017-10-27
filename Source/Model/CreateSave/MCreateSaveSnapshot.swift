import MapKit

extension MCreateSave
{
    //MARK: internal
    
    class func snapshots(
        mapRange:MCreateSaveMapRange,
        completion:@escaping(([UIImage]) -> ()))
    {
        let options:[MKMapSnapshotOptions] = factorySnapshotOptions(
            mapRange:mapRange)
    }
}
