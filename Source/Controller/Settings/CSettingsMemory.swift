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
    
    //MARK: internal
    
    func back()
    {
        parentController?.pop(horizontal:ControllerParent.Horizontal.right)
    }
}
