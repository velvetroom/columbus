import Foundation

final class MCreate:Model<ArchCreate>
{
    private(set) var status:MCreateStatusProtocol?
    
    //MARK: internal
    
    func changeStatus(
        statusType:MCreateStatusProtocol.Type)
    {
        let status:MCreateStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
}
