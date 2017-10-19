import Foundation

extension MCreateMapStatusExpanded
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemContract:MCreateMapMenuContract = MCreateMapMenuContract()
        let itemUser:MCreateMapMenuUser = MCreateMapMenuUser()
        let itemStop:MCreateMapMenuStop = MCreateMapMenuStop()
        
        let items:[MCreateMapMenuProtocol] = [
            itemContract,
            itemUser,
            itemStop]
        
        return items
    }
}
