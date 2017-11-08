import UIKit

extension VSettingsListCellDetailLevelList
{
    //MARK: internal
    
    func factoryViews()
    {
        let selectorMargin2:CGFloat = kSelectorLeft + kSelectorLeft
        let selectorWidth:CGFloat = kCellWidth - selectorMargin2
        
        let viewSelector:VSettingsListCellDetailLevelListSelector = VSettingsListCellDetailLevelListSelector()
        self.viewSelector = viewSelector
        
        let viewRail:VSettingsListCellDetailLevelListRail = VSettingsListCellDetailLevelListRail()
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.backgroundColor = UIColor.clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        self.label = label
        
        insertSubview(
            viewRail,
            belowSubview:collectionView)
        
        insertSubview(
            viewSelector,
            belowSubview:collectionView)
        
        addSubview(label)
        
        layoutSelectorTop = NSLayoutConstraint.topToTop(
            view:viewSelector,
            toView:self)
        NSLayoutConstraint.height(
            view:viewSelector,
            constant:kSelectorHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewSelector,
            toView:self,
            constant:kSelectorLeft)
        NSLayoutConstraint.width(
            view:viewSelector,
            constant:selectorWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:viewRail,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewRail,
            toView:self,
            constant:kRailLeft)
        NSLayoutConstraint.width(
            view:viewRail,
            constant:kRailWidth)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self)
        layoutLabelHeight = NSLayoutConstraint.height(
            view:label)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kCellWidth)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self,
            constant:kLabelRight)
    }
}
