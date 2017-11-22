import Foundation

final class CSettingsMemoryConfirm:Controller<ArchSettingsMemoryConfirm>
{
    init(item:MSettingsMemoryItem)
    {
        super.init()
        
        model.item = item
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
        parentController?.dismissAnimateOver(completion:nil)
    }
}
