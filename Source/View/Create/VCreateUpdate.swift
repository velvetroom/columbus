import UIKit

extension VCreate
{
    //MARK: private
    
    private func asyncUpdateMapMenu(barTop:CGFloat)
    {
        guard
        
            let view:VCreateStatusReady = self.view as? VCreateStatusReady
        
        else
        {
            return
        }
        
        view.viewMapMenu.collectionView.reloadData()
        view.viewBar.animate(
            top:barTop,
            completion:nil)
    }
    
    //MARK: internal
    
    func updateMapMenu(barTop:CGFloat)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateMapMenu(barTop:barTop)
        }
    }
}
