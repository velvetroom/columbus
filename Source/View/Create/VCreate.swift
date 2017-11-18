import UIKit

final class VCreate:ViewMain
{
    private(set) weak var view:View<ArchCreate>?
    
    //MARK: private
    
    private func asyncUpdateStatus()
    {
        self.view?.removeFromSuperview()
        
        guard
        
            let controller:CCreate = self.controller as? CCreate,
            let status:MCreateStatusProtocol = controller.model.status
        
        else
        {
            return
        }
        
        let view:View<ArchCreate> = status.viewType.init(controller:controller)
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
