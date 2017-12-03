import UIKit

extension VHome
{
    //MARK: private
    
    private func asyncUpdateMenu(barBottom:CGFloat)
    {
        guard
            
            let view:VHomeReady = self.view as? VHomeReady
            
        else
        {
            return
        }
        
        view.viewBar.animate(bottom:barBottom)
        { [weak view] in
            
            view?.viewMapMenu.collectionView.reloadData()
        }
    }
    
    //MARK: internal
    
    func updateMenu(barBottom:CGFloat)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncUpdateMenu(barBottom:barBottom)
        }
    }
}
