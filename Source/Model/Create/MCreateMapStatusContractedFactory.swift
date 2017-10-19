import Foundation

extension MCreateMapStatusContracted
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemExpand:MCreateMapMenuExpand = MCreateMapMenuExpand()
        
        let items:[MCreateMapMenuProtocol] = [
            itemExpand]
        
        return items
    }
}
