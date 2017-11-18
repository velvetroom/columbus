import UIKit

extension VSettingsListCellDetailLevelList
{
    //MARK: private
    
    private func factoryString(item:MSettingsDetailLevelProtocol) -> NSAttributedString
    {
        let title:NSAttributedString = factoryTitle(item:item)
        let descr:NSAttributedString = factoryDescr(item:item)
        
        let mutableString:NSMutableAttributedString = NSMutableAttributedString()
        mutableString.append(title)
        mutableString.append(descr)
        
        return mutableString
    }
    
    private func factoryTitle(item:MSettingsDetailLevelProtocol) -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
            NSAttributedStringKey.font : UIFont.regular(
                size:VSettingsListCellDetailLevelList.Constants.fontSize),
            NSAttributedStringKey.foregroundColor : UIColor.colourBackgroundDark]
        
        let string:NSAttributedString = NSAttributedString(
            string:item.title,
            attributes:attributes)
        
        return string
    }
    
    private func factoryDescr(item:MSettingsDetailLevelProtocol) -> NSAttributedString
    {
        let attributes:[NSAttributedStringKey:Any] = [
                NSAttributedStringKey.font : UIFont.regular(
                    size:VSettingsListCellDetailLevelList.Constants.fontSize),
                NSAttributedStringKey.foregroundColor : UIColor(white:0, alpha:0.4)]
        
        let string:NSAttributedString = NSAttributedString(
            string:item.descr,
            attributes:attributes)
        
        return string
    }
    
    private func factoryHeight(string:NSAttributedString) -> CGFloat
    {
        let width:CGFloat = label.bounds.width
        let maxHeight:CGFloat = bounds.height
        
        let size:CGSize = CGSize(
            width:width,
            height:maxHeight)
        
        let options:NSStringDrawingOptions = NSStringDrawingOptions([
                NSStringDrawingOptions.usesLineFragmentOrigin,
                NSStringDrawingOptions.usesFontLeading])
        
        let boundingRect:CGRect = string.boundingRect(
            with:size,
            options:options,
            context:nil)
        
        let height:CGFloat = ceil(boundingRect.height)
        
        return height
    }
    
    //MARK: internal
    
    func updateLabel(
        item:MSettingsDetailLevelProtocol)
    {
        let string:NSAttributedString = factoryString(item:item)
        let height:CGFloat = factoryHeight(string:string)
        label.attributedText = string
        layoutLabelHeight.constant = height
    }
}
