import UIKit

final class VStore:ViewMain
{
    //MARK: private
    
    private func asyncRefresh()
    {
        
    }
    
    //MARK: internal
    
    func refresh()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncRefresh()
        }
    }
}
