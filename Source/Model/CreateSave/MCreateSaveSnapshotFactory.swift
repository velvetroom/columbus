import MapKit

extension MCreateSave
{
    //MARK: private
    
    private func factoryOptions(
        mapRange:MCreateSaveMapRange,
        zoom:MCreateSaveZoomProtocol) -> [MKMapSnapshotOptions]
    {
        guard
        
            let firstZoom:MCreateSaveZoomProtocol = zoom.zoom.first
        
        else
        {
            return
        }
        
        
    }
    
    //MARK: internal
    
    class func factorySnapshotOptions(
        mapRange:MCreateSaveMapRange,
        settings:DSettings) -> [MKMapSnapshotOptions]
    {
        let zoom:MCreateSaveZoomProtocol = MCreateSaveZoomDefault.factoryZoom(
            detailLevel:settings.detailLevel)
        let mapRect:MKMapRect = mapRange.factoryMapRect()
        
        let option:MKMapSnapshotOptions = MKMapSnapshotOptions()
        option.mapRect = mapRect
        
        let options:[MKMapSnapshotOptions] = [
            option]
        
        return options
    }
}
