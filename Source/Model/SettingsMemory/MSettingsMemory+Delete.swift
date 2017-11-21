import Foundation

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncCleanGarbage()
    {
        guard
        
            let garbage:MSettingsMemoryProjects = self.garbage
        
        else
        {
            return
        }
    }
    
    //MARK: internal
    
    func cleanGarbage()
    {
        view?.startLoading()
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.cleanGarbage()
        }
    }
}
