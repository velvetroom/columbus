import UIKit

final class VSettingsMemoryListHeaderBar:View<ArchSettingsMemory>
{
    weak var layoutLineColumbusWidth:NSLayoutConstraint!
    weak var layoutLineOtherWidth:NSLayoutConstraint!
    
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        backgroundColor = UIColor.colourBackgroundGray
        layer.cornerRadius = VSettingsMemoryListHeaderBar.Constants.cornerRadius
        
        factoryViews()
        animateLines()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    func animateLines()
    {
        
    }
}
