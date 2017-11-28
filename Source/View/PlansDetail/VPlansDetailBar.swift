import UIKit

final class VPlansDetailBar:View<ArchPlansDetail>
{
    required init(controller:CPlansDetail)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
