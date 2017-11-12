import MapKit

final class CCreateSearch:Controller<ArchCreateSearch>
{
    private weak var controller:CCreate?
    
    init(controller:CCreate)
    {
        super.init()
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
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
    
    //MARK: private
    
    private func hideViews()
    {
        UIApplication.shared.keyWindow?.endEditing(true)
        
        guard
            
            let view:VCreateSearch = self.view as? VCreateSearch
            
        else
        {
            return
        }
        
        view.animateHide()
    }
    
    //MARK: internal
    
    func back()
    {
        hideViews()
        parentController?.dismissAnimateOver(completion:nil)
    }
    
    func selected(item:MKLocalSearchCompletion)
    {
        hideViews()
        model.searchItem(item:item)
    }
    
    func itemFound(coordinate:CLLocationCoordinate2D)
    {
        guard
            
            let controller:CCreate = self.controller
        
        else
        {
            return
        }
        
        parentController?.dismissAnimateOver
        {
            controller.centreCoordinate(coordinate:coordinate)
        }
    }
}
