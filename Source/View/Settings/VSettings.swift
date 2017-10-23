import UIKit

final class VSettings:ViewMain
{
    weak var viewList:VSettingsList!
    let kBarHeight:CGFloat = 64
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CSettings = controller as? CSettings
        
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
    
    func settingsLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.viewList.collectionView.reloadData()
        }
    }
}
