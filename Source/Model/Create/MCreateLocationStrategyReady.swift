import Foundation

final class MCreateLocationStrategyReady:MCreateLocationStrategyProtocol
{
    private weak var model:MCreate?
    
    func nextStep(model:MCreate)
    {
        self.model = model
        startDatabase()
    }
    
    //MARK: private
    
    private func startDatabase()
    {
        error()
    }
    
    private func createPlan()
    {
        
    }
    
    private func error()
    {
        model?.changeStatus(
            statusType:MCreateStatusErrorDatabase.self)
    }
    
    private func planReady()
    {
        model?.changeMapStatus(
            statusType:MCreateMapStatusContracted.self)
        model?.changeStatus(
            statusType:MCreateStatusReady.self)
    }
}
