import Foundation

final class MHome:Model<ArchHome>
{
    var database:Database?
    var settings:DSettings?
    var plan:MHomePlan?
    let info:[MHomeInfoProtocol]
    private(set) var status:MHomeStatusProtocol?
    private let numberFormatter:NumberFormatter
    
    required init()
    {
        info = MHome.factoryInfo()
        numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = MHome.Constants.Formatter.minIntegers
        numberFormatter.maximumFractionDigits = MHome.Constants.Formatter.maxDecimals
        
        super.init()
    }
    
    //MARK: internal
    
    func changeStatus(statusType:MHomeStatusProtocol.Type)
    {
        let status:MHomeStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
}
