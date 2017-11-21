import UIKit

final class VSettingsMemoryList:VCollection<
    ArchSettingsMemory,
    VSettingsMemoryListCell>
{
    private var cellSize:CGSize?
    
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
        layout collectionViewLayout:UICollectionViewLayout,
        sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        guard
        
            let cellSize:CGSize = self.cellSize
        
        else
        {
            let width:CGFloat = collectionView.bounds.width
            let cellSize:CGSize = CGSize(
                width:width,
                height:VSettingsMemoryList.Constants.cellHeight)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
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
        guard
            
            kind == UICollectionElementKindSectionHeader
        
        else
        {
            let footer:VSettingsMemoryListFooter = reusableAtIndex(
                kind:kind,
                indexPath:indexPath)
            
            footer.config(controller:controller)
            
            return footer
        }
        
        let header:VSettingsMemoryListHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        header.config(controller:controller)
        
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
