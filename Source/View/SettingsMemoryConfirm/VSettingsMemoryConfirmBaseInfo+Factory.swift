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
            NSAttributedStringKey.font:UIFont.regular(size:VSettingsMemoryConfirmBaseInfo.Constants.fontSize),
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
        
    }
    
    private func factoryDestination(
        attributesTitle:[NSAttributedStringKey:Any],
        attributesText:[NSAttributedStringKey:Any]) -> NSAttributedString?
    {
        
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
        
        NSLayoutConstraint.topToBottom(
            view:label,
            toView:self,
            constant:VSettingsMemoryConfirmBaseInfo.Constants.marginTop)
        NSLayoutConstraint.equalsHorizontal(
            view:label,
            toView:self,
            margin:VSettingsMemoryConfirmBaseInfo.Constants.marginHorizontal)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:label)
    }
}
