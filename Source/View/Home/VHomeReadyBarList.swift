import UIKit

final class VHomeReadyBarList:VCollection<
    ArchHome,
    VHomeReadyBarListCell>
{
    private var cellSize:CGSize?
    
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
                height:VHomeReadyBarList.Constants.cellHeight)
            
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let count:Int = controller.model.plan?.items.count
        
        else
        {
            return 0
        }
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomePlanItemProtocol = modelAtIndex(index:indexPath)
        
        let cell:VHomeReadyBarListCell = cellAtIndex(
            indexPath:indexPath,
            reusableIdentifier:item.reusableIdentifier)
        
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        let item:MHomePlanItemProtocol = modelAtIndex(index:indexPath)
        
        guard
            
            let itemStop:MHomePlanItemStop = item as? MHomePlanItemStop
        
        else
        {
            return
        }
        
        selectInMap(item:itemStop.stop)
    }
}
