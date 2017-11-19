import UIKit

extension VSettingsMemoryListHeader
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.font = UIFont.regular(size:VSettingsMemoryListHeader.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"VSettingsMemoryListHeader_labelTitle")
        
        addSubview(labelTitle)
        
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
    }
}
