import Foundation

final class MCreateLocationStrategyUnknown:MCreateLocationStrategyProtocol
{
    func nextStep(model:MCreate)
    {
        model.changeStatus(
            statusType:MCreateStatusNeedsPermision.self)
    }
}
