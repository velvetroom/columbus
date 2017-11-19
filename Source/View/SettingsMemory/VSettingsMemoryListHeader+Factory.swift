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
        
        addSubview(backgroundView)
        addSubview(labelTitle)
        
        NSLayoutConstraint.topToTop(
            view:backgroundView,
            toView:self,
            constant:ViewMain.Constants.barHeight)
        NSLayoutConstraint.bottomToBottom(
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
    }
}
