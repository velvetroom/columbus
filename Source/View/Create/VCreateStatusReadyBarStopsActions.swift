import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func selectItem(index:Int)
    {
        let indexPath:IndexPath = IndexPath(
            item:index,
            section:0)
        collectionView.selectItem(
            at:indexPath,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition.centeredVertically)
    }
    
    func deselectAll()
    {
        collectionView.selectItem(
            at:nil,
            animated:true,
            scrollPosition:UICollectionViewScrollPosition())
    }
}
