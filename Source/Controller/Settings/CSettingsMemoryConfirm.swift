import Foundation

final class CSettingsMemoryConfirm:Controller<ArchSettingsMemoryConfirm>
{
    private weak var controller:CSettingsMemory?
    
    init(
        controller:CSettingsMemory,
        item:MSettingsMemoryItem)
    {
        super.init()
        
        model.item = item
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func cancel()
    {
        parentController?.dismissAnimateOver(completion:nil)
    }
    
    func delete()
    {
        guard
            
            let controller:CSettingsMemory = self.controller,
            let item:MSettingsMemoryItem = model.item
        
        else
        {
            return
        }
        
        parentController?.dismissAnimateOver
        {
            controller.confirmDelete(item:item)
        }
    }
}
