import UIKit

final class VSettingsListCellDistance:VSettingsListCell
{
    weak var viewSegmented:UISegmentedControl!
    weak var layoutSegmentedLeft:NSLayoutConstraint!
    let kTitleHeight:CGFloat = 60
    let kTitleLeft:CGFloat = 20
    let kTitleFontSize:CGFloat = 16
    let kSegmentedTop:CGFloat = 80
    let kSegmentedHeight:CGFloat = 32
    let kSegmentedWidth:CGFloat = 270
    private weak var model:MSettingsDistance?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        factoryTitle()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let remainSegmented:CGFloat = width - kSegmentedWidth
        let segmentedLeft:CGFloat = remainSegmented / 2.0
        layoutSegmentedLeft.constant = segmentedLeft
        
        super.layoutSubviews()
    }
    
    override func config(
        controller:CSettings,
        model:MSettingsProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:MSettingsDistance = model as? MSettingsDistance
            
        else
        {
            return
        }
        
        self.model = model
        
        factorySegmented(model:model)
        updateSegmented()
    }
    
    //MARK: private
    
    private func updateSegmented()
    {
        guard
            
            let index:Int = self.model?.selectedIndex()
            
        else
        {
            return
        }
        
        viewSegmented.selectedSegmentIndex = index
    }
}
