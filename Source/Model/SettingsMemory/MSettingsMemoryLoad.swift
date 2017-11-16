import Foundation

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncLoad()
    {
        system = MSettingsMemorySystem.factorySystem()
        
        print(system)
        
        factoryItems()
    }
    
    private func factoryItems()
    {
        
    }
    
    //MARK: internal
    
    func load()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad()
        }
    }
}
