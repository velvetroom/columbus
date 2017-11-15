import UIKit

final class VSettingsListCellStorage:VSettingsListCell
{
    private let kTitleFontSize:CGFloat = 16
    private(set) weak var model:MSettingsStorage?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(
            UIColor.colourBackgroundDark,
            for:UIControlState.normal)
        button.setTitleColor(
            UIColor.colourBackgroundGray,
            for:UIControlState.highlighted)
        button.setTitle(
            String.localizedView(key:"VSettingsListCellStorage_title"),
            for:UIControlState.normal)
        button.titleLabel!.font = UIFont.regular(
            size:kTitleFontSize)
        button.addTarget(
            self,
            action:#selector(selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(button)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(
        controller:CSettings,
        model:MSettingsProtocol)
    {
        super.config(
            controller:controller,
            model:model)
        
        guard
            
            let model:MSettingsStorage = model as? MSettingsStorage
            
        else
        {
            return
        }
        
        self.model = model
    }
    
    //MARK: selectors
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        
    }
}
