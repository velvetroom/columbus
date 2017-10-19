import Foundation

extension MCreateMapStatusContracted
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemExpand:MCreateMapMenuExpand = MCreateMapMenuExpand()
        let itemUser:MCreateMapMenuUser = MCreateMapMenuUser()
        
        let items:[MCreateMapMenuProtocol] = [
            itemExpand,
            itemUser]
        
        return items
    }
}
