import UIKit

extension VSettingsMemoryListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let backgroundView:UIView = UIView()
        backgroundView.isUserInteractionEnabled = false
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = UIColor.white
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:VSettingsMemoryListHeader.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"VSettingsMemoryListHeader_labelTitle")
        
        let labelUsage:UILabel = UILabel()
        labelUsage.isUserInteractionEnabled = false
        labelUsage.translatesAutoresizingMaskIntoConstraints = false
        labelUsage.backgroundColor = UIColor.clear
        labelUsage.font = UIFont.regular(size:VSettingsMemoryListHeader.Constants.usageFontSize)
        labelUsage.textColor = UIColor(white:0, alpha:0.5)
        labelUsage.textAlignment = NSTextAlignment.right
        self.labelUsage = labelUsage
        
        addSubview(backgroundView)
        addSubview(labelTitle)
        addSubview(labelUsage)
        
        NSLayoutConstraint.topToTop(
            view:backgroundView,
            toView:self,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.bottomToBottom(
            view:backgroundView,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:backgroundView,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:VSettingsMemoryListHeader.Constants.headingHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:VSettingsMemoryListHeader.Constants.paddingHorizontal)
        NSLayoutConstraint.width(
            view:labelTitle,
            constant:VSettingsMemoryListHeader.Constants.headingWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelUsage,
            toView:self,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.height(
            view:labelUsage,
            constant:VSettingsMemoryListHeader.Constants.headingHeight)
        NSLayoutConstraint.rightToRight(
            view:labelUsage,
            toView:self,
            constant:-VSettingsMemoryListHeader.Constants.paddingHorizontal)
        NSLayoutConstraint.width(
            view:labelUsage,
            constant:VSettingsMemoryListHeader.Constants.headingWidth)
    }
    
    func factoryBar(controller:CSettingsMemory)
    {
        let viewBar:VSettingsMemoryListHeaderBar = VSettingsMemoryListHeaderBar(controller:controller)
        self.viewBar = viewBar
        
        addSubview(viewBar)
        
        NSLayoutConstraint.topToBottom(
            view:viewBar,
            toView:labelUsage)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:VSettingsMemoryListHeader.Constants.barHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self,
            margin:VSettingsMemoryListHeader.Constants.paddingHorizontal)
    }
}
