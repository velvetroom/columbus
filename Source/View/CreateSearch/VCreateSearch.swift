import UIKit

final class VCreateSearch:ViewMain
{
    weak var viewBase:VCreateSearchBase!
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
        
            let controller:CCreateSearch = controller as? CCreateSearch
        
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
    
    //MARK: private
    
    private func asyncUpdateList()
    {
        viewBase.viewList.update()
    }
    
    //MARK: internal
    
    func updateList()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateList()
        }
    }
}
