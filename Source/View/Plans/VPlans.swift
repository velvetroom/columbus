import UIKit

final class VPlans:ViewMain
{
    weak var viewList:VPlansList!
    let kBarHeight:CGFloat = 64
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CPlans = controller as? CPlans
        
        else
        {
            return
        }
        
        factoryViews(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func plansLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewList.collectionView.reloadData()
        }
    }
}
