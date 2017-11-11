import Foundation

final class CCreateSearch:Controller<ArchCreateSearch>
{
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
