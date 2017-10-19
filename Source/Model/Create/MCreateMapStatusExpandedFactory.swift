import Foundation

extension MCreateMapStatusExpanded
{
    //MARK: internal
    
    static func factoryMenuItems() -> [MCreateMapMenuProtocol]
    {
        let itemContract:MCreateMapMenuContract = MCreateMapMenuContract()
        
        let items:[MCreateMapMenuProtocol] = [
            itemContract]
        
        return items
    }
}
