import UIKit

final class VSettingsMemoryList:VCollection<
    ArchSettingsMemory,
    VSettingsMemoryListCell>
{
    let kInterItem:CGFloat = 1
    let kHeaderHeight:CGFloat = 124
    let kCollectionBottom:CGFloat = 10
    
    required init(controller:CSettingsMemory)
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
        let header:VSettingsMemoryListHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return header
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let cell:VSettingsMemoryListCell = cellAtIndex(indexPath:indexPath)
        
        return cell
    }
}
