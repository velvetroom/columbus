import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    func nextStep(model:MCreate)
    {
        model.changeStatus(
            statusType:MCreateStatusReady.self)
        
        guard
        
            let controller:CCreate = model.view?.controller as? CCreate
        
        else
        {
            return
        }
        
        controller.lightStatusBar()
    }
}
