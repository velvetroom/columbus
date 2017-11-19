import UIKit

final class VSettingsMemoryList:VCollection<
    ArchSettingsMemory,
    VSettingsMemoryListCell>
{
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func numberOfSections(
        in collectionView:UICollectionView) -> Int
    {
        guard
        
            controller.model.system == nil
        
        else
        {
            return 1
        }
        
        return 0
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
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
