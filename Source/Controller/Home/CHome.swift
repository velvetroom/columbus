import Foundation

final class CHome:Controller<ArchHome>
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        parentController?.view.isUserInteractionEnabled = false
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.model.loadSettings()
        }
    }
    
    //MARK: private
    
    private func asyncSettingsLoaded()
    {
        parentController?.view.isUserInteractionEnabled = true
    }
    
    //MARK: internal
    
    func settingsLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncSettingsLoaded()
        }
    }
}
