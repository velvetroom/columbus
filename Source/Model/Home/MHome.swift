import Foundation

final class MHome:Model<ArchHome>
{
    var database:Database?
    var settings:DSettings?
    private(set) var status:MHomeStatusProtocol?
    
    //MARK: internal
    
    func changeStatus(
        statusType:MHomeStatusProtocol.Type)
    {
        let status:MHomeStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
}
