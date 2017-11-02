import UIKit

extension VHomeStandbyCell
{
    //MARK: private
    
    private func factoryTitle(
        model:MHomeInfoProtocol) -> NSAttributedString
    {
        let string:NSAttributedString = NSAttributedString(
            string:model.title,
            attributes:attributesTitle)
        
        return string
    }
    
    private func factoryDescr(
        model:MHomeInfoProtocol) -> NSAttributedString
    {
        let string:NSAttributedString = NSAttributedString(
            string:model.descr,
            attributes:attributesDescr)
        
        return string
    }
    
    //MARK: internal
    
    class func factoryAttributesTitle(
        fontSize:CGFloat) -> [
        NSAttributedStringKey:Any]
    {
        let attributes:[
            NSAttributedStringKey:Any] = [
                NSAttributedStringKey.font:
                    UIFont.medium(size:fontSize),
                NSAttributedStringKey.foregroundColor:
                    UIColor.colourBackgroundDark]
        
        return attributes
    }
    
    class func factoryAttributesDescr(
        fontSize:CGFloat) -> [
        NSAttributedStringKey:Any]
    {
        let attributes:[
            NSAttributedStringKey:Any] = [
                NSAttributedStringKey.font:
                    UIFont.regular(size:fontSize),
                NSAttributedStringKey.foregroundColor:
                    UIColor(white:0.5, alpha:1)]
        
        return attributes
    }
    
    func factoryViews()
    {
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        self.icon = icon
        
        let labelInfo:UILabel = UILabel()
        labelInfo.isUserInteractionEnabled = false
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.backgroundColor = UIColor.clear
        labelInfo.numberOfLines = 0
        self.labelInfo = labelInfo
        
        addSubview(icon)
        addSubview(labelInfo)
        
        NSLayoutConstraint.topToTop(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.size(
            view:icon,
            constant:kIconSize)
        
        NSLayoutConstraint.topToTop(
            view:labelInfo,
            toView:self,
            constant:kInfoTop)
        layoutInfoHeight = NSLayoutConstraint.height(
            view:labelInfo)
        NSLayoutConstraint.leftToRight(
            view:labelInfo,
            toView:icon)
        NSLayoutConstraint.rightToRight(
            view:labelInfo,
            toView:self,
            constant:kInfoRight)
    }
    
    func factoryInfo(
        model:MHomeInfoProtocol) -> NSAttributedString
    {
        let title:NSAttributedString = factoryTitle(
            model:model)
        let descr:NSAttributedString = factoryDescr(
            model:model)
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        mutableString.append(descr)
        
        return mutableString
    }
}
