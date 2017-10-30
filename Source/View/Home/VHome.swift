import UIKit

final class VHome:ViewMain
{
    private(set) weak var view:View<ArchHome>?
    
    //MARK: private
    
    private func asyncUpdateStatus()
    {
        self.view?.removeFromSuperview()
        
        guard
            
            let controller:CHome = self.controller as? CHome,
            let status:MHomeStatusProtocol = controller.model.status
            
        else
        {
            return
        }
        
        let view:View<ArchHome> = status.viewType.init(
            controller:controller)
        self.view = view
        
        addSubview(view)
        
        NSLayoutConstraint.equals(
            view:view,
            toView:self)
    }
    
    //MARK: internal
    
    func updateStatus()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateStatus()
        }
    }
}
