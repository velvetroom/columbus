import Foundation

final class CCreateTravel:Controller<ArchCreateTravel>
{
    private weak var controller:CCreate!
    
    init(
        controller:CCreate,
        travel:DPlanTravel)
    {
        super.init()
        model.travel = travel
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func back()
    {
        guard
            
            let travel:DPlanTravel = model.travel
        
        else
        {
            return
        }
        
        parentController?.dismissAnimateOver
        { [weak controller] in
            
            controller?.travelEdited(travel:travel)
        }
    }
}
