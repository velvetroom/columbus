import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    func nextStep(model:MCreate)
    {
        model.changeStatus(
            statusType:MCreateStatusReady.self)
    }
}
