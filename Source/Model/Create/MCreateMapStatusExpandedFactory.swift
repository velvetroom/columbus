import Foundation

extension MCreateMapStatusExpanded
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemContract:MCreateMapMenuContract = MCreateMapMenuContract()
        let itemUser:MCreateMapMenuUser = MCreateMapMenuUser()
        let itemStop:MCreateMapMenuStop = MCreateMapMenuStop()
        let itemDone:MCreateMapMenuDone = MCreateMapMenuDone()
        
        let items:[MCreateMapMenuProtocol] = [
            itemContract,
            itemUser,
            itemStop,
            itemDone]
        
        return items
    }
}
