import Foundation

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncLoad()
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
