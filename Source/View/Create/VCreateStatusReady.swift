import UIKit

final class VCreateStatusReady:View<ArchCreate>
{
    weak var viewBar:VCreateStatusReadyBar!
    weak var viewMap:VCreateStatusReadyMap!
    weak var viewMapMenu:VCreateStatusReadyMapMenu!
    let kBottom:CGFloat = -50
    let kMapMenuWidth:CGFloat = 70
    private let kWaitForAnimation:TimeInterval = 1.4
    
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
        DispatchQueue.main.asyncAfter(
            deadline:
            DispatchTime.now() + kWaitForAnimation)
        { [weak self] in
            
            self?.asyncAnimateStart()
        }
    }
    
    private func asyncAnimateStart()
    {
        viewBar.animate(top:0)
        { [weak self] in
            
            self?.controller.lightStatusBar()
        }
    }
}
