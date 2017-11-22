import UIKit

final class VSettingsMemoryConfirmBase:View<ArchSettingsMemoryConfirm>
{
    required init(controller:CSettingsMemoryConfirm)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        layer.cornerRadius = VSettingsMemoryConfirmBase.Constants.cornerRadius
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: selectors
    
    @objc
    func selectorDelete(sender button:UIButton)
    {
        controller.delete()
    }
    
    @objc
    func selectorCancel(sender button:UIButton)
    {
        controller.cancel()
    }
}
