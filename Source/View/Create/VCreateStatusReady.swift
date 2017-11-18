import UIKit

final class VCreateStatusReady:View<ArchCreate>
{
    weak var viewBar:VCreateStatusReadyBar!
    weak var viewMap:VCreateStatusReadyMap!
    weak var viewMapMenu:VCreateStatusReadyMapMenu!
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        
        factoryViews()
        animateStart()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func animateStart()
    {
        let deadline:DispatchTime = DispatchTime.now() + VCreateStatusReady.Constants.waitForAnimation
        DispatchQueue.main.asyncAfter(deadline:deadline)
        { [weak self] in
            
            self?.asyncAnimateStart()
        }
    }
    
    private func asyncAnimateStart()
    {
        viewBar.animate(top:0)
        { [weak self] in
            
            self?.controller.lightStatusBar()
            self?.viewMapMenu.animateShow()
        }
    }
}
