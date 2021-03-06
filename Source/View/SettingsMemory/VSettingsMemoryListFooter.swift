import UIKit

final class VSettingsMemoryListFooter:UICollectionReusableView
{
    weak var labelSize:UILabel!
    weak var buttonClean:UIButton!
    weak var labelEmpty:UILabel!
    private weak var controller:CSettingsMemory?
    
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
    func selectorClean(sender button:UIButton)
    {
        controller?.model.cleanGarbage()
    }
    
    //MARK: private
    
    private func updateSize(
        model:MSettingsMemory,
        garbage:MSettingsMemoryProjects)
    {
        guard
        
            let megas:String = model.bytesAsMB(bytes:garbage.size)
        
        else
        {
            return
        }
        
        labelSize.text = megas
        showSize()
    }
    
    private func showSize()
    {
        labelEmpty.isHidden = true
        labelSize.isHidden = false
        buttonClean.isHidden = false
    }
    
    private func showEmpty()
    {
        labelEmpty.isHidden = false
        labelSize.isHidden = true
        buttonClean.isHidden = true
    }
    
    //MARK: internal
    
    func config(controller:CSettingsMemory)
    {
        self.controller = controller
        let model:MSettingsMemory = controller.model
        
        guard
        
            let garbage:MSettingsMemoryProjects = model.garbage,
            garbage.size > 0
        
        else
        {
            showEmpty()
            
            return
        }
        
        updateSize(
            model:model,
            garbage:garbage)
    }
}
