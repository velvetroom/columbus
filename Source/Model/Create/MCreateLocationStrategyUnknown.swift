import Foundation

final class MCreateLocationStrategyUnknown:MCreateLocationStrategyProtocol
{
    //MARK: internal
    
    func nextStep(model:MCreate)
    {
        model.changeStatus(
            statusType:MCreateStatusNeedsPermision.self)
    }
}
