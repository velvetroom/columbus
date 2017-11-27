import Foundation

extension MHomeMapStatusExpanded
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MHomeMapMenuProtocol]
    {
        let itemUser:MHomeMapMenuUser = MHomeMapMenuUser()
        let itemContract:MHomeMapMenuContract = MHomeMapMenuContract()
        
        let items:[MHomeMapMenuProtocol] = [
            itemUser,
            itemContract]
        
        return items
    }
}
