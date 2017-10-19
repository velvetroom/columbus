import Foundation

final class MCreate:Model<ArchCreate>
{
    let locationDelegate:MCreateLocationDelegate
    private(set) var status:MCreateStatusProtocol?
    private(set) var mapStatus:MCreateMapStatusProtocol?
    private(set) var locationStrategy:MCreateLocationStrategyProtocol?
    
    required init()
    {
        locationDelegate = MCreateLocationDelegate()
        
        super.init()
        
        locationDelegate.model = self
    }
    
    deinit
    {
        locationDelegate.clean()
    }
    
    //MARK: internal
    
    func changeStatus(
        statusType:MCreateStatusProtocol.Type)
    {
        let status:MCreateStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
    
    func changeMapStatus(
        statusType:MCreateMapStatusProtocol.Type)
    {
        let mapStatus:MCreateMapStatusProtocol = statusType.init()
        self.mapStatus = mapStatus
        
        view?.updateMapMenu(
            barTop:mapStatus.barTop)
    }
    
    func changeLocationStrategy(
        locationStrategyType:MCreateLocationStrategyProtocol.Type)
    {
        let locationStrategy:MCreateLocationStrategyProtocol = locationStrategyType.init()
        self.locationStrategy = locationStrategy
        
        locationStrategy.nextStep(model:self)
    }
}
