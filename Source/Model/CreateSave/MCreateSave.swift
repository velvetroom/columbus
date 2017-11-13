import MapKit

final class MCreateSave:Model<ArchCreateSave>
{
    static let kPaddingTile:Double = 1
    static let kTileSize:Double = 256
    static let kTileScale:Double = 2
    static let kAppleToGoogleMaps:Double = 1048575
    
    weak var database:Database?
    weak var plan:DPlan?
    weak var settings:DSettings?
    weak var snapshotter:MKMapSnapshotter?
    var builder:MCreateSaveBuilder?
    private(set) var status:MCreateSaveStatusProtocol?
    
    deinit
    {
        builder?.timer?.invalidate()
    }
    
    //MARK: internal
    
    func changeStatus(statusType:MCreateSaveStatusProtocol.Type)
    {
        let status:MCreateSaveStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
    
    func cancel()
    {
        builder?.timer?.invalidate()
        snapshotter?.cancel()
    }
    
    func buildingError()
    {
        cancel()
        changeStatus(statusType:MCreateSaveStatusError.self)
    }
    
    func retryBuilding()
    {
        changeStatus(statusType:MCreateSaveStatusBusy.self)
        pullSnapshot()
    }
}
