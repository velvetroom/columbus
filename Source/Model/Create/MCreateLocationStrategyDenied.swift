import Foundation

final class MCreateLocationStrategyDenied:MCreateLocationStrategyProtocol
{
    private weak var model:MCreate?
    
    init()
    {
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(selectorBecameActive(sender:)),
            name:NSNotification.Name.UIApplicationDidBecomeActive,
            object:nil)
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    func nextStep(model:MCreate)
    {
        self.model = model
        model.changeStatus(
            statusType:MCreateStatusDenied.self)
    }
    
    //MARK: selectors
    
    @objc
    private func selectorBecameActive(sender notification:Notification)
    {
        model?.checkAuthorization()
    }
}
