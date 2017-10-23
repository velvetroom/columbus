import Foundation

extension MCreate
{
    //MARK: private
    
    private func asyncSave()
    {
        saveFinished()
    }
    
    private func saveFinished()
    {
        DispatchQueue.main.async
        { [weak self] in
        
            self?.moveToPlans()
        }
    }
    
    private func moveToPlans()
    {
        guard
        
            let controller:CCreate = view?.controller as? CCreate
        
        else
        {
            return
        }
        
        controller.moveToPlans()
    }
    
    //MARK: internal
    
    func save()
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncSave()
        }
    }
}
