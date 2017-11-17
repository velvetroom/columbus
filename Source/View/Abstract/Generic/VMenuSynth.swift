import UIKit

extension VMenu
{
    //MARK: private
    
    private func synthSelect(index:Int)
    {
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        let item:MMenuItemProtocol = modelAtIndex(index:indexPath)
        
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
        
        controller.menuSelected(item:item)
    }
    
    //MARK: internal
    
    func synthSelect(order:MMenu.Order)
    {
        let totalItems:Int = collectionView.numberOfItems(
            inSection:0)
        let index:Int = order.rawValue
        
        guard
        
            totalItems > index
        
        else
        {
            return
        }
        
        synthSelect(index:index)
    }
}
