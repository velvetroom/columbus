import Foundation

extension MSettingsMemory
{
    //MARK: private
    
    private func asyncCleanGarbage()
    {
        guard
        
            let identifiers:[String] = self.garbage?.identifiers
        
        else
        {
            return
        }
        
        for identifier:String in identifiers
        {
            deleteDirectory(identifier:identifier)
        }
        
        view?.reload()
    }
    
    private func deleteDirectory(identifier:String)
    {
        guard
            
            let projectsPath:URL = MCreateSave.projectsDirectory()
        
        else
        {
            return
        }
        
        let project:URL = projectsPath.appendingPathComponent(identifier)
        
        do
        {
            try FileManager.default.removeItem(at:project)
        }
        catch { }
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
