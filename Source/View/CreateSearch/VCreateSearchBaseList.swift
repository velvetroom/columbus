import UIKit

final class VCreateSearchBaseList:VCollection
    <ArchCreateSearch,
    VCreateSearchBaseListCell>
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
