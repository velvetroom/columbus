import Foundation

extension MCreateMapStatusExpanded
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemContract:MCreateMapMenuContract = MCreateMapMenuContract()
        let itemUser:MCreateMapMenuUser = MCreateMapMenuUser()
        
        let items:[MCreateMapMenuProtocol] = [
            itemContract,
            itemUser]
        
        return items
    }
}
