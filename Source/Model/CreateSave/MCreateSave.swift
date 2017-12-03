import MapKit

final class MCreateSave:Model<ArchCreateSave>
{
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
        
        let deadline:DispatchTime = DispatchTime.now() + MCreateSave.Constants.TimeIntervals.snapshotWait
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.pullSnapshot()
        }
    }
}
