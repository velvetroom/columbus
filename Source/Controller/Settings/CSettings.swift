import Foundation

final class CSettings:Controller<ArchSettings>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        DispatchQueue.global(
            qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.model.loadSettings()
        }
    }
    
    //MARK: internal
    
    func openMemory(
        database:Database,
        settings:DSettings)
    {
        let controller:CSettingsMemory = CSettingsMemory(
            database:database,
            settings:settings)
        
        parentController?.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
}
