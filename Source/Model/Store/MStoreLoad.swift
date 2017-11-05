import Foundation

extension MStore
{
    //MARK: private
    
    private func asyncLoad()
    {
        changeStatus(statusType:MStoreStatusLoading.self)
    }
    
    //MARK: internal
    
    func load()
    {
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoad()
        }
    }
}
