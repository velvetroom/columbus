import Foundation

extension MStore
{
    //MARK: private
    
    private func purchase(
        model:MStorePerkProtocol,
        settings:DSettings,
        database:Database)
    {
        guard
        
            settings.perksMap[model.perkType] == nil
        
        else
        {
            return
        }
        
        database.create
        { [weak self] (perk:DPerk) in
            
            self?.purchase(
                perk:perk,
                model:model,
                settings:settings,
                database:database)
        }
    }
    
    private func purchase(
        perk:DPerk,
        model:MStorePerkProtocol,
        settings:DSettings,
        database:Database)
    {
        perk.type = model.perkType
        perk.identifier = model.identifier
        perk.settings = settings
        
        database.save { }
    }
    
    //MARK: internal
    
    func purchase(model:MStorePerkProtocol)
    {
        guard
        
            let settings:DSettings = self.settings,
            let database:Database = self.database
        
        else
        {
            return
        }
        
        purchase(
            model:model,
            settings:settings,
            database:database)
    }
}
