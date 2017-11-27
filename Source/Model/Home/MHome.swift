import Foundation

final class MHome:Model<ArchHome>
{
    var database:Database?
    var settings:DSettings?
    var plan:MHomePlan?
    let info:[MHomeInfoProtocol]
    private(set) var status:MHomeStatusProtocol?
    private(set) var mapStatus:MHomeMapStatusProtocol?
    
    required init()
    {
        info = MHome.factoryInfo()
        
        super.init()
    }
    
    //MARK: internal
    
    func changeStatus(statusType:MHomeStatusProtocol.Type)
    {
        let status:MHomeStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
    
    func changeMapStatus(statusType:MHomeMapStatusProtocol.Type)
    {
        let mapStatus:MHomeMapStatusProtocol = statusType.init()
        self.mapStatus = mapStatus
        
        view?.updateMenu(barBottom:mapStatus.barBottom)
    }
}
