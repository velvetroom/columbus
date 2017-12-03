import Foundation

extension MCreate
{
    //MARK: internal
    
    func load()
    {
        guard
        
            database == nil,
            settings == nil
        
        else
        {
            checkAuthorization()
            
            return
        }
        
        loadSettings(bundle:nil)
        { [weak self] in
            
            self?.checkAuthorization()
        }
    }
    
    func loadSettings(
        bundle:Bundle?,
        completion:@escaping(() -> ()))
    {
        MCreate.factorySettings(bundle:bundle)
        { [weak self] (database:Database, settings:DSettings) in
            
            self?.database = database
            self?.settings = settings
            completion()
        }
    }
}
