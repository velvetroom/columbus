import UIKit

final class VPlansDetailList:VCollection<
    ArchPlansDetail,
    VPlansDetailListCell>
{
    required init(controller:CPlansDetail)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
