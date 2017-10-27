import Foundation

final class CCreateSave:Controller<ArchCreateSave>
{
    //MARK: internal
    
    func moveToPlans()
    {
        guard
            
            let viewParent:ViewParent = parentController?.view as? ViewParent
            
        else
        {
            return
        }
        
        let order:MMenuOrder = MMenuOrder.plans
        viewParent.viewMenu.synthSelect(
            order:order)
    }
}
