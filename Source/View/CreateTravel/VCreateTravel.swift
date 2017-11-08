import UIKit

final class VCreateTravel:ViewMain
{
    weak var layoutListTop:NSLayoutConstraint!
    weak var layoutListLeft:NSLayoutConstraint!
    let kListHeight:CGFloat = 240
    let kListWidth:CGFloat = 50
    
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
        let remainWidth:CGFloat = width - kListWidth
        let remainHeight:CGFloat = height - kListHeight
        let marginLeft:CGFloat = remainWidth / 2.0
        let marginTop:CGFloat = remainHeight / 2.0
        layoutListLeft.constant = marginLeft
        layoutListTop.constant = marginTop
        
        super.layoutSubviews()
    }
}
