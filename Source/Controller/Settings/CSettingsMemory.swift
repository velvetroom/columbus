import Foundation

final class CSettingsMemory:Controller<ArchSettingsMemory>
{
    init(
        database:Database,
        settings:DSettings)
    {
        super.init()
        model.database = database
        model.settings = settings
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        model.load()
    }
    
    //MARK: internal
    
    func back()
    {
        parentController?.pop(horizontal:ControllerTransition.Horizontal.right)
    }
    
    func delete(item:MSettingsMemoryItem)
    {
        let controller:CSettingsMemoryConfirm = CSettingsMemoryConfirm(
            controller:self,
            item:item)
        
        parentController?.animateOver(controller:controller)
    }
    
    func confirmDelete(item:MSettingsMemoryItem)
    {
        model.delete(item:item)
    }
}
