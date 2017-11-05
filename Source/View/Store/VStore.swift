import UIKit

final class VStore:ViewMain
{
    private(set) weak var view:View<ArchStore>?
    
    //MARK: private
    
    private func asyncUpdateStatus()
    {
        self.view?.removeFromSuperview()
        
        guard
            
            let controller:CStore = self.controller as? CStore,
            let status:MStoreStatusProtocol = controller.model.status
            
        else
        {
            return
        }
        
        let view:View<ArchStore> = status.viewType.init(
            controller:controller)
        self.view = view
        
        addSubview(view)
        
        NSLayoutConstraint.equals(
            view:view,
            toView:self)
    }
    
    private func asyncRefreshStore()
    {
        
    }
    
    //MARK: internal
    
    func updateStatus()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateStatus()
        }
    }
    
    func refreshStore()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncRefreshStore()
        }
    }
}
