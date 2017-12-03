import UIKit

final class VSettingsMemoryListCell:UICollectionViewCell
{
    weak var labelOrigin:UILabel!
    weak var labelDestination:UILabel!
    weak var labelSize:UILabel!
    private weak var controller:CSettingsMemory?
    private var model:MSettingsMemoryItem?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        
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
        guard
        
            let controller:CSettingsMemory = self.controller,
            let model:MSettingsMemoryItem = self.model
        
        else
        {
            return
        }
        
        controller.delete(item:model)
    }
    
    //MARK: internal
    
    func config(
        controller:CSettingsMemory,
        model:MSettingsMemoryItem)
    {
        guard
        
            let size:String = controller.model.bytesAsMB(bytes:model.size)
        
        else
        {
            return
        }
        
        labelSize.text = size
        labelOrigin.text = model.plan.origin?.name
        labelDestination.text = model.plan.destination?.name
        self.controller = controller
        self.model = model
    }
}
