import Foundation

final class MCreateLocationStrategyDenied:MCreateLocationStrategyProtocol
{
    func nextStep(model:MCreate)
    {
        model.changeStatus(
            statusType:MCreateStatusDenied.self)
    }
}
