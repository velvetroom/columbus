import UIKit

extension VSettingsListCellTravelModeList
{
    //MARK: internal
    
    func config()
    {
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.scrollDirection = UICollectionViewScrollDirection.horizontal
        }
        
        let viewSelector:VSettingsListCellTravelModeListSelector = VSettingsListCellTravelModeListSelector()
        self.viewSelector = viewSelector
        
        insertSubview(
            viewSelector,
            belowSubview:collectionView)
        
        layoutSelectorTop = NSLayoutConstraint.topToTop(
            view:viewSelector,
            toView:self)
        layoutSelectorLeft = NSLayoutConstraint.leftToLeft(
            view:viewSelector,
            toView:self)
        NSLayoutConstraint.size(
            view:viewSelector,
            constant:kSelectorSize)
    }
}
