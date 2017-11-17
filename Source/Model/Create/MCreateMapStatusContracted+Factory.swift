import Foundation

extension MCreateMapStatusContracted
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemExpand:MCreateMapMenuExpand = MCreateMapMenuExpand()
        let itemUser:MCreateMapMenuUser = MCreateMapMenuUser()
        let itemStop:MCreateMapMenuStop = MCreateMapMenuStop()
        let itemSearch:MCreateMapMenuSearch = MCreateMapMenuSearch()
        let itemDone:MCreateMapMenuDone = MCreateMapMenuDone()
        
        let items:[MCreateMapMenuProtocol] = [
            itemExpand,
            itemUser,
            itemStop,
            itemSearch,
            itemDone]
        
        return items
    }
}
