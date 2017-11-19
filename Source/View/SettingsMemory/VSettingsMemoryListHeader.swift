import UIKit

final class VSettingsMemoryListHeader:UICollectionReusableView
{
    weak var viewBar:VSettingsMemoryListHeaderBar?
    weak var labelUsage:UILabel!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func updateUsage(model:MSettingsMemory)
    {
        guard
        
            let systemMemory:CGFloat = model.system?.systemSize,
            let usedMemory:CGFloat = model.system?.usedSize,
            let system:String = model.bytesAsRoundedGB(bytes:systemMemory),
            let used:String = model.bytesAsGB(bytes:usedMemory)
        
        else
        {
            return
        }
        
        let string:String = String(
            format:String.localizedView(key:"VSettingsMemoryListHeader_labelUsage"),
            system,
            used)
        
        labelUsage.text = string
    }
    
    //MARK: internal
    
    func config(controller:CSettingsMemory)
    {
        guard
        
            viewBar == nil
        
        else
        {
            return
        }
        
        factoryBar(controller:controller)
        updateUsage(model:controller.model)
    }
}
