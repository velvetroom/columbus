import UIKit

extension VSettingsListCellDetailLevelList
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewSelector:VSettingsListCellDetailLevelListSelector = VSettingsListCellDetailLevelListSelector()
        self.viewSelector = viewSelector
        
        let viewRail:VSettingsListCellDetailLevelListRail = VSettingsListCellDetailLevelListRail()
        
        insertSubview(
            viewRail,
            belowSubview:collectionView)
        
        insertSubview(
            viewSelector,
            belowSubview:collectionView)
        
        layoutSelectorTop = NSLayoutConstraint.topToTop(
            view:viewSelector,
            toView:self)
        NSLayoutConstraint.height(
            view:viewSelector,
            constant:kSelectorHeight)
        NSLayoutConstraint.leftToLeft(
            view:viewSelector,
            toView:self,
            constant:kSelectorMarginHorizontal)
        NSLayoutConstraint.equalsHorizontal(
            view:viewSelector,
            toView:self,
            margin:kSelectorMarginHorizontal)
        
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
    }
}