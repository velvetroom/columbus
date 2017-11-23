import UIKit

final class VSettingsListCellStorage:VSettingsListCell
{
    private(set) weak var model:MSettingsStorage?
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let icon:UIImageView = UIImageView()
        icon.isUserInteractionEnabled = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.clipsToBounds = true
        icon.contentMode = UIViewContentMode.center
        icon.image = #imageLiteral(resourceName: "assetGenericStorage")
        
        let label:UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.isUserInteractionEnabled = false
        label.text = String.localizedView(key:"VSettingsListCellStorage_title")
        label.font = UIFont.medium(size:VSettingsListCellStorage.Constants.titleFontSize)
        label.textColor = UIColor.colourBackgroundDark
        
        let button:UIButton = UIButton()
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action:#selector(selectorHighlighted(sender:)),
            for:UIControlEvents.touchDown)
        button.addTarget(
            self,
            action:#selector(selectorUnhighlighted(sender:)),
            for:UIControlEvents.touchUpOutside)
        button.addTarget(
            self,
            action:#selector(selectorButton(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(icon)
        addSubview(label)
        addSubview(button)
        
        NSLayoutConstraint.equalsVertical(
            view:icon,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:icon,
            toView:self)
        NSLayoutConstraint.width(
            view:icon,
            constant:VSettingsListCellStorage.Constants.iconWidth)
        
        NSLayoutConstraint.equals(
            view:button,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToRight(
            view:label,
            toView:icon)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:label)
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
    private func selectorHighlighted(sender button:UIButton)
    {
        alpha = VSettingsListCellStorage.Constants.alphaHighlighted
    }
    
    @objc
    private func selectorUnhighlighted(sender button:UIButton)
    {
        alpha = 1
    }
    
    @objc
    private func selectorButton(sender button:UIButton)
    {
        selectorUnhighlighted(sender:button)
        
        guard
        
            let database:Database = model?.database,
            let settings:DSettings = model?.settings
        
        else
        {
            return
        }
        
        controller?.openMemory(
            database:database,
            settings:settings)
    }
}
