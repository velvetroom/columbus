import UIKit

extension VSettingsMemoryConfirmBaseInfo
{
    //MARK: private
    
    private func factoryDescription() -> NSAttributedString
    {
        let attributesTitle:[NSAttributedStringKey:Any] = factoryAttributesTitle()
        let attributesText:[NSAttributedStringKey:Any] = factoryAttributesText()
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        
        if let origin:NSAttributedString = factoryOrigin(
            attributesTitle:attributesTitle,
            attributesText:attributesText)
        {
            mutableString.append(origin)
        }
        
        if let destination:NSAttributedString = factoryDestination(
            attributesTitle:attributesTitle,
            attributesText:attributesText)
        {
            mutableString.append(destination)
        }
        
        return mutableString
    }
    
    private func factoryAttributesTitle() -> [NSAttributedStringKey:Any]
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.medium(size:VSettingsMemoryConfirmBaseInfo.Constants.fontSize),
            NSAttributedStringKey.foregroundColor:UIColor.colourBackgroundDark]
        
        return attributes
    }
    
    private func factoryAttributesText() -> [NSAttributedStringKey:Any]
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font:UIFont.regular(size:VSettingsMemoryConfirmBaseInfo.Constants.fontSize),
            NSAttributedStringKey.foregroundColor:UIColor(white:0, alpha:0.5)]
        
        return attributes
    }
    
    private func factoryOrigin(
        attributesTitle:[NSAttributedStringKey:Any],
        attributesText:[NSAttributedStringKey:Any]) -> NSAttributedString?
    {
        guard
        
            let origin:String = controller.model.item?.plan.origin?.name
        
        else
        {
            return nil
        }
        
        let title:String = String.localizedView(key:"VSettingsMemoryConfirmBaseInfo_originTitle")
        let titleString:NSAttributedString = NSAttributedString(
            string:title,
            attributes:attributesTitle)
        
        let textString:NSAttributedString = NSAttributedString(
            string:origin,
            attributes:attributesText)
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(titleString)
        mutableString.append(textString)
        
        return mutableString
    }
    
    private func factoryDestination(
        attributesTitle:[NSAttributedStringKey:Any],
        attributesText:[NSAttributedStringKey:Any]) -> NSAttributedString?
    {
        guard
            
            let destination:String = controller.model.item?.plan.destination?.name
            
        else
        {
            return nil
        }
        
        let title:String = String.localizedView(key:"VSettingsMemoryConfirmBaseInfo_destinationTitle")
        let titleString:NSAttributedString = NSAttributedString(
            string:title,
            attributes:attributesTitle)
        
        let textString:NSAttributedString = NSAttributedString(
            string:destination,
            attributes:attributesText)
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(titleString)
        mutableString.append(textString)
        
        return mutableString
    }
    
    //MARK: internal
    
    func factoryViews()
    {
        let text:NSAttributedString = factoryDescription()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.attributedText = text
        
        addSubview(label)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self,
            constant:VSettingsMemoryConfirmBaseInfo.Constants.margin)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:VSettingsMemoryConfirmBaseInfo.Constants.margin)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:label)
    }
}
