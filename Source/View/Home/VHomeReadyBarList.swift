import UIKit

final class VHomeReadyBarList:VCollection<
    ArchHome,
    UICollectionViewCell>
{
    required init(controller:CHome)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let header:VHomeReadyBarListHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return header
    }
}
