import UIKit

final class MCreateMapMenuDone:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonDone")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonDoneSelected")
    
    //MARK: internal
    
    func selected(controller:CCreate)
    {
        controller.model.save()
    }
}
