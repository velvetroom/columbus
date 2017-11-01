import UIKit

extension VSettingsListCellDetailLevelList
{
    //MARK: internal
    
    func config()
    {
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.vertical
        }
        
        let viewSelector:VSettingsListCellDetailLevelListSelector = VSettingsListCellDetailLevelListSelector()
        self.viewSelector = viewSelector
        
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
    }
}
