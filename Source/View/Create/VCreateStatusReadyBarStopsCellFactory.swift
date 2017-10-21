import UIKit

extension VCreateStatusReadyBarStopsCell
{
    //MARK: internal
    
    func factoryViews()
    {
        let buttonRemove:UIButton = UIButton()
        buttonRemove.translatesAutoresizingMaskIntoConstraints = false
        buttonRemove.setImage(
            #imageLiteral(resourceName: "assetGenericDelete").withRenderingMode(UIImageRenderingMode.alwaysOriginal),
            for:UIControlState.normal)
        buttonRemove.setImage(
            #imageLiteral(resourceName: "assetGenericDelete").withRenderingMode(UIImageRenderingMode.alwaysTemplate),
            for:UIControlState.highlighted)
        buttonRemove.imageView!.clipsToBounds = true
        buttonRemove.imageView!.contentMode = UIViewContentMode.center
        buttonRemove.imageView!.tintColor = UIColor.black
        
        addSubview(buttonRemove)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonRemove,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonRemove,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonRemove,
            constant:kRemoveWidth)
    }
}
