import UIKit

final class VCreateSearchList:VCollection
    <ArchCreateSearch,
    VCreateSearchListCell>
{
    
    
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
