import UIKit

final class VPlansList:VCollection<
    ArchPlans,
    VPlansListCell>
{
    let kInterItem:CGFloat = 4
    let kInsetsTop:CGFloat = 63
    let kInsetsBottom:CGFloat = 70
    
    required init(controller:CPlans)
    {
        super.init(controller:controller)
        
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
