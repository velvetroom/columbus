import UIKit

final class MCreateMapMenuDone:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonDone")
    
    func selected(controller:CCreate)
    {
    }
}
