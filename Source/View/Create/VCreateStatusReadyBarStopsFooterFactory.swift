import UIKit

extension VCreateStatusReadyBarStopsFooter
{
    //MARK: internal
    
    func factoryViews()
    {
        let labelDistanceTitle:UILabel = UILabel()
        labelDistanceTitle.isUserInteractionEnabled = false
        labelDistanceTitle.translatesAutoresizingMaskIntoConstraints = false
        labelDistanceTitle.backgroundColor = UIColor.clear
        labelDistanceTitle.font = UIFont.regular(
            size:kTitleFontSize)
        labelDistanceTitle.textColor = UIColor(white:1, alpha:0.6)
        labelDistanceTitle.text = String.localizedView(
            key:"VCreateStatusReadyBarStopsFooter_labelDistanceTitle")
        
        let labelDistanceValue:UILabel = UILabel()
        labelDistanceValue.isUserInteractionEnabled = false
        labelDistanceValue.translatesAutoresizingMaskIntoConstraints = false
        labelDistanceValue.backgroundColor = UIColor.clear
        labelDistanceValue.font = UIFont.medium(
            size:kValueFontSize)
        labelDistanceValue.textColor = UIColor.white
        self.labelDistanceValue = labelDistanceValue
        
        let labelDurationTitle:UILabel = UILabel()
        labelDurationTitle.isUserInteractionEnabled = false
        labelDurationTitle.translatesAutoresizingMaskIntoConstraints = false
        labelDurationTitle.backgroundColor = UIColor.clear
        labelDurationTitle.font = UIFont.regular(
            size:kTitleFontSize)
        labelDurationTitle.textColor = UIColor(white:1, alpha:0.6)
        labelDurationTitle.text = String.localizedView(
            key:"VCreateStatusReadyBarStopsFooter_labelDurationTitle")
        
        let labelDurationValue:UILabel = UILabel()
        labelDurationValue.isUserInteractionEnabled = false
        labelDurationValue.translatesAutoresizingMaskIntoConstraints = false
        labelDurationValue.backgroundColor = UIColor.clear
        labelDurationValue.font = UIFont.medium(
            size:kValueFontSize)
        labelDurationValue.textColor = UIColor.white
        self.labelDurationValue = labelDurationValue
        
        addSubview(labelDistanceTitle)
        addSubview(labelDurationTitle)
        addSubview(labelDistanceValue)
        addSubview(labelDurationValue)
        
        NSLayoutConstraint.topToTop(
            view:labelDistanceTitle,
            toView:self,
            constant:kDistanceTop)
        NSLayoutConstraint.height(
            view:labelDistanceTitle,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelDistanceTitle,
            toView:self,
            constant:kTitleLeft)
        NSLayoutConstraint.width(
            view:labelDistanceTitle,
            constant:kTitleWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelDistanceValue,
            toView:self,
            constant:kDistanceTop)
        NSLayoutConstraint.height(
            view:labelDistanceValue,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDistanceValue,
            toView:labelDistanceTitle,
            constant:kValueLeft)
        NSLayoutConstraint.width(
            view:labelDistanceValue,
            constant:kValueWidth)
        
        NSLayoutConstraint.topToBottom(
            view:labelDurationTitle,
            toView:labelDistanceTitle)
        NSLayoutConstraint.height(
            view:labelDurationTitle,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToLeft(
            view:labelDurationTitle,
            toView:self,
            constant:kTitleLeft)
        NSLayoutConstraint.width(
            view:labelDurationTitle,
            constant:kTitleWidth)
        
        NSLayoutConstraint.topToBottom(
            view:labelDurationValue,
            toView:labelDistanceValue)
        NSLayoutConstraint.height(
            view:labelDurationValue,
            constant:kLabelHeight)
        NSLayoutConstraint.leftToRight(
            view:labelDurationValue,
            toView:labelDurationTitle,
            constant:kValueLeft)
        NSLayoutConstraint.width(
            view:labelDurationValue,
            constant:kTitleWidth)
    }
}
