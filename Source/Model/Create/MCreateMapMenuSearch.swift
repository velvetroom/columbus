import UIKit

final class MCreateMapMenuSearch:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonSearch")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonSearchSelected")
    
    //MARK: internal
    
    func selected(controller:CCreate)
    {
        controller.showSearch()
    }
}
