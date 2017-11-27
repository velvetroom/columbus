import Foundation

extension MHomeMapStatusContracted
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MHomeMapMenuProtocol]
    {
        let itemUser:MHomeMapMenuUser = MHomeMapMenuUser()
        let itemExpand:MHomeMapMenuExpand = MHomeMapMenuExpand()
        
        let items:[MHomeMapMenuProtocol] = [
            itemUser
            itemExpand]
        
        return items
    }
}
