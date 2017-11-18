import UIKit

final class VSettingsListCellDistance:VSettingsListCell
{
    weak var viewSegmented:UISegmentedControl!
    weak var layoutSegmentedLeft:NSLayoutConstraint!
    private(set) weak var model:MSettingsDistance?
    
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
        let remainSegmented:CGFloat = width - VSettingsListCellDistance.Constants.segmentedWidth
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
        updateSegmented(model:model)
    }
    
    //MARK: private
    
    private func updateSegmented(model:MSettingsDistance)
    {
        guard
            
            let index:Int = model.selectedIndex
            
        else
        {
            return
        }
        
        viewSegmented.selectedSegmentIndex = index
    }
}
