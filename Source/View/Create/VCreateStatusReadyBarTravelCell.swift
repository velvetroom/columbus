import UIKit

final class VCreateStatusReadyBarTravelCell:UICollectionViewCell
{
    weak var imageView:UIImageView!
    private(set) weak var controller:CCreate?
    private(set) weak var model:DPlanTravel?
    
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
            imageView.tintColor = UIColor.black
        }
        else
        {
            imageView.tintColor = UIColor.white
        }
    }
    
    //MARK: internal
    
    func config(
        controller:CCreate,
        model:DPlanTravel)
    {
        self.controller = controller
        self.model = model
        
        let image:UIImage? = VCreateStatusReadyBarTravelCell.factoryImage(mode:model.mode)
        imageView.image = image
        
        hover()
    }
}
