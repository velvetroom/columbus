import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    func nextStep(model:MCreate)
    {
        model.changeMapStatus(
            statusType:MCreateMapStatusContracted.self)
        model.changeStatus(
            statusType:MCreateStatusReady.self)
    }
}
