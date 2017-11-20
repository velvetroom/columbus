import UIKit

extension VSettingsMemoryListFooter
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.font = UIFont.regular(size:VSettingsMemoryListFooter.Constants.titleFontSize)
        labelTitle.textColor = UIColor.colourBackgroundDark
        labelTitle.text = String.localizedView(key:"VSettingsMemoryListFooter_labelTitle")
        
        let labelDescr:UILabel = UILabel()
        labelDescr.isUserInteractionEnabled = false
        labelDescr.backgroundColor = UIColor.clear
        labelDescr.translatesAutoresizingMaskIntoConstraints = false
        labelDescr.font = UIFont.regular(size:VSettingsMemoryListFooter.Constants.titleFontSize)
        labelDescr.textColor = UIColor(white:0, alpha:0.5)
        labelDescr.text = String.localizedView(key:"VSettingsMemoryListFooter_labelDescr")
        labelDescr.numberOfLines = 0
        
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
        addSubview(labelTitle)
        addSubview(labelDescr)
        addSubview(border)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:VSettingsMemoryListFooter.Constants.titleHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelTitle,
            toView:self,
            constant:VSettingsMemoryListFooter.Constants.paddingHorizontal)
        
        NSLayoutConstraint.topToBottom(
            view:border,
            toView:labelTitle)
        NSLayoutConstraint.height(
            view:border,
            constant:ViewMain.Constants.borderWidth)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self,
            margin:VSettingsMemoryListFooter.Constants.paddingHorizontal)
        
        NSLayoutConstraint.topToBottom(
            view:labelDescr,
            toView:border,
            constant:VSettingsMemoryListFooter.Constants.descrTop)
        NSLayoutConstraint.heightGreaterOrEqual(
            view:labelDescr,
            constant:VSettingsMemoryListFooter.Constants.descrHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelDescr,
            toView:self,
            margin:VSettingsMemoryListFooter.Constants.paddingHorizontal)
    }
}
