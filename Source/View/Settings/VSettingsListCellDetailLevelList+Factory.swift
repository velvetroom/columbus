import UIKit

extension VSettingsListCellDetailLevelList
{
    //MARK: internal
    
    func factoryViews()
    {
        let selectorMargin2:CGFloat = VSettingsListCellDetailLevelList.Constants.selectorLeft * 2
        let selectorWidth:CGFloat = VSettingsListCellDetailLevelList.Constants.cellWidth - selectorMargin2
        
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
            constant:VSettingsListCellDetailLevelList.Constants.selectorHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewSelector,
            toView:self,
            constant:VSettingsListCellDetailLevelList.Constants.selectorLeft)
        NSLayoutConstraint.width(
            view:viewSelector,
            constant:selectorWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:viewRail,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewRail,
            toView:self,
            constant:VSettingsListCellDetailLevelList.Constants.railLeft)
        NSLayoutConstraint.width(
            view:viewRail,
            constant:VSettingsListCellDetailLevelList.Constants.railWidth)
        
        NSLayoutConstraint.topToTop(
            view:label,
            toView:self)
        layoutLabelHeight = NSLayoutConstraint.height(
            view:label)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:VSettingsListCellDetailLevelList.Constants.cellWidth)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self,
            constant:VSettingsListCellDetailLevelList.Constants.labelRight)
    }
}
