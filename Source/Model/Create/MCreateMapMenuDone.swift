import UIKit

final class MCreateMapMenuDone:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type? = nil
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonDone")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonDoneSelected")
    
    //MARK: private
    
    private func confirmDone(controller:CCreate)
    {
        controller.save()
    }
    
    private func errorNotStops()
    {
        let message:String = String.localizedModel(key:"MCreateMapMenuDone_noStops")
        
        VAlert.messageFail(message:message)
    }
    
    //MARK: internal
    
    func selected(controller:CCreate)
    {
        guard
        
            isDoneable(plan:controller.model.plan?.plan)
        
        else
        {
            errorNotStops()
            
            return
        }
        
        confirmDone(controller:controller)
    }
    
    func isDoneable(plan:DPlan?) -> Bool
    {
        guard
        
            let count:Int = plan?.stops?.count,
            count > 0
        
        else
        {
            return false
        }
        
        return true
    }
}
