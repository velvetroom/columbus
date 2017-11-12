import Foundation

final class CCreateSearch:Controller<ArchCreateSearch>
{
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
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
