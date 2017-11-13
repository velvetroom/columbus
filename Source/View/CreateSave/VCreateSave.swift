import UIKit

final class VCreateSave:ViewMain
{
    private(set) weak var view:View<ArchCreateSave>?
    
    //MARK: private
    
    private func asyncUpdateStatus()
    {
        self.view?.removeFromSuperview()
        
        guard
            
            let controller:CCreateSave = self.controller as? CCreateSave,
            let status:MCreateSaveStatusProtocol = controller.model.status
            
        else
        {
            return
        }
        
        let view:View<ArchCreateSave> = status.viewType.init(
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
