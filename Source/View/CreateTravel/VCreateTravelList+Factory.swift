import UIKit

extension VCreateTravelList
{
    //MARK: internal
    
    func factoryViews()
    {
        let viewSelector:VCreateTravelListSelector = VCreateTravelListSelector()
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
            constant:VCreateTravelList.Constants.selectorSize)
    }
}
