import UIKit

final class VCreateStatusReadyBarStopsCell:UICollectionViewCell
{
    weak var viewField:VCreateStatusReadyBarStopsCellField!
    private(set) weak var controller:CCreate?
    private(set) weak var model:DPlanStop?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            viewField.selected()
        }
        else
        {
            viewField.notSelected()
        }
    }
    
    //MARK: internal
    
    func config(
        controller:CCreate,
        model:DPlanStop)
    {
        self.controller = controller
        self.model = model
        
        viewField.config(stop:model)
        hover()
    }
}
