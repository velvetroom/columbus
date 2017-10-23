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
}
