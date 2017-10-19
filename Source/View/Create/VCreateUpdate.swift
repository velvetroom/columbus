import UIKit

extension VCreate
{
    //MARK: private
    
    private func asyncUpdateMapMenu()
    {
        guard
        
            let view:VCreateStatusReady = self.view as? VCreateStatusReady
        
        else
        {
            return
        }
        
        view.viewMapMenu.collectionView.reloadData()
    }
    
    //MARK: internal
    
    func updateMapMenu()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateMapMenu()
        }
    }
}
