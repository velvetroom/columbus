import Foundation

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncCleanGarbage()
    {
        guard
        
            let identifiers:[String] = garbage?.identifiers
        
        else
        {
            return
        }
        
        for identifier:String in identifiers
        {
            MGlobalPlan.deleteDirectory(identifier:identifier)
        }
        
        load()
    }
    
    //MARK: internal
    
    func cleanGarbage()
    {
        view?.startLoading()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncCleanGarbage()
        }
    }
    
    func delete(item:MSettingsMemoryItem)
    {
        view?.startLoading()
        
        guard
            
            let database:Database = self.database
        
        else
        {
            return
        }
        
        MGlobalPlan.delete(
            database:database,
            plan:item.plan)
        { [weak self] in
            
            self?.load()
        }
    }
}
