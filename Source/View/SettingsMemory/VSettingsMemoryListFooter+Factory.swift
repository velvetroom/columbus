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
        labelDescr.font = UIFont.regular(size:VSettingsMemoryListFooter.Constants.descrFontSize)
        labelDescr.textColor = UIColor(white:0, alpha:0.5)
        labelDescr.text = String.localizedView(key:"VSettingsMemoryListFooter_labelDescr")
        labelDescr.numberOfLines = 0
        
        let labelEmpty:UILabel = UILabel()
        labelEmpty.isUserInteractionEnabled = false
        labelEmpty.translatesAutoresizingMaskIntoConstraints = false
        labelEmpty.backgroundColor = UIColor.clear
        labelEmpty.textAlignment = NSTextAlignment.right
        labelEmpty.font = UIFont.regular(size:VSettingsMemoryListFooter.Constants.titleFontSize)
        labelEmpty.textColor = UIColor(white:0, alpha:0.5)
        labelEmpty.text = String.localizedView(key:"VSettingsMemoryListFooter_labelEmpty")
        self.labelEmpty = labelEmpty
        
        let buttonClean:UIButton = UIButton()
        buttonClean.translatesAutoresizingMaskIntoConstraints = false
        buttonClean.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        buttonClean.setTitleColor(
            UIColor.colourBackgroundGray,
            for:UIControlState.highlighted)
        buttonClean.setTitle(
            String.localizedView(key:"VSettingsMemoryListFooter_buttonClean"),
            for:UIControlState.normal)
        buttonClean.titleLabel!.font = UIFont.medium(
            size:VSettingsMemoryListFooter.Constants.titleFontSize)
        buttonClean.isHidden = true
        self.buttonClean = buttonClean
        
        let labelSize:UILabel = UILabel()
        labelSize.isUserInteractionEnabled = false
        labelSize.translatesAutoresizingMaskIntoConstraints = false
        labelSize.backgroundColor = UIColor.clear
        labelSize.textAlignment = NSTextAlignment.right
        labelSize.font = UIFont.regular(size:VSettingsMemoryListFooter.Constants.titleFontSize)
        labelSize.textColor = UIColor(white:0, alpha:0.5)
        labelSize.isHidden = true
        self.labelSize = labelSize
        
        let border:VBorder = VBorder(colour:UIColor.colourBackgroundGray)
        
        addSubview(labelTitle)
        addSubview(labelDescr)
        addSubview(labelEmpty)
        addSubview(labelSize)
        addSubview(border)
        addSubview(buttonClean)
        
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
        
        NSLayoutConstraint.topToTop(
            view:labelEmpty,
            toView:self)
        NSLayoutConstraint.height(
            view:labelEmpty,
            constant:VSettingsMemoryListFooter.Constants.titleHeight)
        NSLayoutConstraint.rightToRight(
            view:labelEmpty,
            toView:self,
            constant:-VSettingsMemoryListFooter.Constants.paddingHorizontal)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelEmpty)
        
        NSLayoutConstraint.topToTop(
            view:buttonClean,
            toView:self)
        NSLayoutConstraint.height(
            view:buttonClean,
            constant:VSettingsMemoryListFooter.Constants.titleHeight)
        NSLayoutConstraint.rightToRight(
            view:buttonClean,
            toView:self,
            constant:-VSettingsMemoryListFooter.Constants.paddingHorizontal)
        NSLayoutConstraint.width(
            view:buttonClean,
            constant:VSettingsMemoryListFooter.Constants.cleanWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelSize,
            toView:self)
        NSLayoutConstraint.height(
            view:labelSize,
            constant:VSettingsMemoryListFooter.Constants.titleHeight)
        NSLayoutConstraint.rightToLeft(
            view:labelSize,
            toView:buttonClean)
        NSLayoutConstraint.widthGreaterOrEqual(
            view:labelSize)
    }
}
