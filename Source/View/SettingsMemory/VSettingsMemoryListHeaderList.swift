import UIKit

final class VSettingsMemoryListHeaderList:View<ArchSettingsMemory>
{
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let badgeColumbus:VSettingsMemoryListHeaderListBadge = VSettingsMemoryListHeaderListBadge(
            controller:controller)
        badgeColumbus.backgroundColor = UIColor.colourSuccess
        
        let badgeOther:VSettingsMemoryListHeaderListBadge = VSettingsMemoryListHeaderListBadge(
            controller:controller)
        badgeOther.backgroundColor = UIColor(white:0.8, alpha:1)
        
        let labelColumbus:UILabel = UILabel()
        labelColumbus.isUserInteractionEnabled = false
        labelColumbus.backgroundColor = UIColor.clear
        labelColumbus.translatesAutoresizingMaskIntoConstraints = false
        labelColumbus.font = UIFont.regular(size:VSettingsMemoryListHeaderList.Constants.fontSize)
        labelColumbus.textColor = UIColor.colourBackgroundDark
        labelColumbus.text = String.localizedView(key:"VSettingsMemoryListHeaderList_labelColumbus")
        
        let labelOther:UILabel = UILabel()
        labelOther.isUserInteractionEnabled = false
        labelOther.backgroundColor = UIColor.clear
        labelOther.translatesAutoresizingMaskIntoConstraints = false
        labelOther.font = UIFont.regular(size:VSettingsMemoryListHeaderList.Constants.fontSize)
        labelOther.textColor = UIColor.colourBackgroundDark
        labelOther.text = String.localizedView(key:"VSettingsMemoryListHeaderList_labelOther")
        
        addSubview(badgeColumbus)
        addSubview(badgeOther)
        addSubview(labelColumbus)
        addSubview(labelOther)
        
        NSLayoutConstraint.topToTop(
            view:badgeColumbus,
            toView:self,
            constant:VSettingsMemoryListHeaderList.Constants.badgeTop)
        NSLayoutConstraint.leftToLeft(
            view:badgeColumbus,
            toView:self)
        NSLayoutConstraint.size(
            view:badgeColumbus,
            constant:VSettingsMemoryListHeaderList.Constants.badgeSize)
        
        NSLayoutConstraint.topToTop(
            view:labelColumbus,
            toView:self)
        NSLayoutConstraint.height(
            view:labelColumbus,
            constant:VSettingsMemoryListHeaderList.Constants.labelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelColumbus,
            toView:badgeColumbus,
            constant:VSettingsMemoryListHeaderList.Constants.labelLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelColumbus,
            constant:VSettingsMemoryListHeaderList.Constants.labelWidth)
        
        NSLayoutConstraint.topToTop(
            view:badgeOther,
            toView:self,
            constant:VSettingsMemoryListHeaderList.Constants.badgeTop)
        NSLayoutConstraint.leftToRight(
            view:badgeOther,
            toView:labelColumbus,
            constant:VSettingsMemoryListHeaderList.Constants.labelRight)
        NSLayoutConstraint.size(
            view:badgeOther,
            constant:VSettingsMemoryListHeaderList.Constants.badgeSize)
        
        NSLayoutConstraint.topToTop(
            view:labelOther,
            toView:self)
        NSLayoutConstraint.height(
            view:labelOther,
            constant:VSettingsMemoryListHeaderList.Constants.labelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelOther,
            toView:badgeOther,
            constant:VSettingsMemoryListHeaderList.Constants.labelLeft)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelOther,
            constant:VSettingsMemoryListHeaderList.Constants.labelWidth)
    }
}
