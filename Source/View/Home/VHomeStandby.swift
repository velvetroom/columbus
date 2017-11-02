import UIKit

final class VHomeStandby:VCollection<
    ArchHome,
    VHomeStandbyCell>
{
    let kHeaderHeight:CGFloat = 250
    let kInterItem:CGFloat = 1
    
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
        let header:VHomeStandbyHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return header
    }
}
