import UIKit

final class VCreateTravel:ViewMain
{
    weak var layoutListTop:NSLayoutConstraint!
    weak var layoutListLeft:NSLayoutConstraint!
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
            
            let controller:CCreateTravel = controller as? CCreateTravel
        
        else
        {
            return
        }
        
        factoryViews(controller:controller)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let height:CGFloat = bounds.height
        let remainWidth:CGFloat = width - VCreateTravel.Constants.listWidth
        let remainHeight:CGFloat = height - VCreateTravel.Constants.listHeight
        let marginLeft:CGFloat = remainWidth / 2.0
        let marginTop:CGFloat = remainHeight / 2.0
        layoutListLeft.constant = marginLeft
        layoutListTop.constant = marginTop
        
        super.layoutSubviews()
    }
}
