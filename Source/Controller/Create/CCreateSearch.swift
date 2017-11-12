import Foundation

final class CCreateSearch:Controller<ArchCreateSearch>
{
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        
        guard
            
            let view:VCreateSearch = self.view as? VCreateSearch
            
        else
        {
            return
        }
        
        view.animateShow()
    }
    
    //MARK: internal
    
    func back()
    {
        guard
        
            let view:VCreateSearch = self.view as? VCreateSearch
        
        else
        {
            return
        }
        
        view.animateHide()
        parentController?.dismissAnimateOver(completion:nil)
    }
}
