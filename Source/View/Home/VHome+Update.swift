import UIKit

extension VHome
{
    //MARK: private
    
    private func asyncUpdateMapMenu()
    {
        guard
            
            let view:VHomeReady = self.view as? VHomeReady
            
        else
        {
            return
        }
        
        view?.viewMapMenu.collectionView.reloadData()
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
