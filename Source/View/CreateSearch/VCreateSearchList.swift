import UIKit

final class VCreateSearchList:VCollection
    <ArchCreateSearch,
    VCreateSearchListCell>
{
    weak var layoutTop:NSLayoutConstraint!
    let kHeight:CGFloat = 300
    
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
