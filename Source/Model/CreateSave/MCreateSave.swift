import Foundation

final class MCreateSave:Model<ArchCreateSave>
{
    static let kPaddingTile:Double = 1
    static let kTileSize:Double = 256
    static let kTileScale:Double = 2
    static let kAppleToGoogleMaps:Double = 1048575
    
    weak var database:Database?
    weak var plan:DPlan?
    weak var settings:DSettings?
    weak var timer:Timer?
    var dispatchGroup:DispatchGroup?
    var urls:[URL]
    private(set) var status:MCreateSaveStatusProtocol?
    private let kTimeout:TimeInterval = 9
    
    required init()
    {
        dispatchGroup = MCreateSave.factoryDispatchGroup()
        urls = []
        
        super.init()
        
        changeStatus(statusType:MCreateSaveStatusBusy.self)
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    //MARK: selectors
    
    @objc
    private func selectorTimeout(sender timer:Timer)
    {
        timer.invalidate()
//        dispatchGroup = nil
//        savedSnapshots()
        changeStatus(statusType:MCreateSaveStatusError.self)
    }
    
    //MARK: private
    
    private func asyncStartTimer()
    {
        let timer:Timer = Timer.scheduledTimer(
            timeInterval:kTimeout,
            target:self,
            selector:#selector(selectorTimeout(sender:)),
            userInfo:nil,
            repeats:false)
        
        self.timer = timer
    }
    
    private func changeStatus(statusType:MCreateSaveStatusProtocol.Type)
    {
        let status:MCreateSaveStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
    
    //MARK: internal
    
    func startTimer()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncStartTimer()
        }
    }
}
