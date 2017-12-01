import UIKit

extension VPlansDetailListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        let iconDistance:UIImageView = UIImageView()
        iconDistance.isUserInteractionEnabled = false
        iconDistance.translatesAutoresizingMaskIntoConstraints = false
        iconDistance.clipsToBounds = true
        iconDistance.contentMode = UIViewContentMode.center
        iconDistance.tintColor = UIColor.colourBackgroundDark
        iconDistance.image = #imageLiteral(resourceName: "assetMapDistance").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        let iconDuration:UIImageView = UIImageView()
        iconDuration.isUserInteractionEnabled = false
        iconDuration.translatesAutoresizingMaskIntoConstraints = false
        iconDuration.clipsToBounds = true
        iconDuration.contentMode = UIViewContentMode.center
        iconDuration.tintColor = UIColor.colourBackgroundDark
        iconDuration.image = #imageLiteral(resourceName: "assetMapDuration").withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        addSubview(border)
        addSubview(iconDuration)
        addSubview(iconDistance)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:iconDuration,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDuration,
            constant:VPlansDetailListHeader.Constants.iconWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:iconDistance,
            toView:self)
        NSLayoutConstraint.width(
            view:iconDistance,
            constant:VPlansDetailListHeader.Constants.iconWidth)
    }
}
