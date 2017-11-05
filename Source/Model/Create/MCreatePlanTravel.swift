import Foundation

extension MCreatePlan
{
    //MARK: private
    
    private func asyncRemoveTravel(
        travel:DPlanTravel)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.removeTravel(travel:travel)
        }
    }
    
    private func asyncUpdated(
        travel:DPlanTravel)
    {
        addTravel(travel:travel)
        updated(travel:travel)
    }
    
    //MARK: internal
    
    func update(travel:DPlanTravel)
    {
        asyncRemoveTravel(travel:travel)
        
        factoryDirections(travel:travel)
        { [weak self] in
            
            self?.asyncUpdated(travel:travel)
        }
    }
}
