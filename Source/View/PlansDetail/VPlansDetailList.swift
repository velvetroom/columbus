import UIKit

final class VPlansDetailList:VCollection<
    ArchPlansDetail,
    VPlansDetailListCell>
{
    required init(controller:CPlansDetail)
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
        let item:MPlansDetailItemProtocol = modelAtIndex(index:indexPath)
        let width:CGFloat = collectionView.bounds.width
        
        let cellSize:CGSize = CGSize(
            width:width,
            height:item.cellHeight)
        
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
        let header:VPlansDetailListHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        header.config(controller:controller)
        
        return header
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MPlansDetailItemProtocol = modelAtIndex(index:indexPath)
        
        let cell:VPlansDetailListCell = cellAtIndex(
            indexPath:indexPath,
            reusableIdentifier:item.reusableIdentifier)
        
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
}
