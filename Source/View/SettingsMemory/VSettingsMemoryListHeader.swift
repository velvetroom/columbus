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
        
            let systemBytes:CGFloat = model.system?.systemSize,
            let usedBytes:CGFloat = model.system?.usedSize,
            let systemString:String = model.bytesAsRoundedGB(bytes:systemBytes),
            let usedString:String = model.bytesAsGB(bytes:usedBytes)
        
        else
        {
            return
        }
        
        let string:String = String(
            format:String.localizedView(key:"VSettingsMemoryListHeader_labelUsage"),
            usedString,
            systemString)
        
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
