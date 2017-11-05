import UIKit

final class VCreateTravelList:VCollection<
    ArchCreateTravel,
    VCreateTravelListCell>
{
    private var cellSize:CGSize?
    
    required init(controller:CCreateTravel)
    {
        super.init(controller:controller)
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        factoryViews()
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
            let height:CGFloat = collectionView.bounds.height
            let cellsInt:Int = collectionView.numberOfItems(
                inSection:0)
            let cells:CGFloat = CGFloat(cellsInt)
            let heightPerCell:CGFloat = height / cells
            let cellSize:CGSize = CGSize(
                width:width,
                height:heightPerCell)
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
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateTravelProtocol = modelAtIndex(
            index:indexPath)
        let cell:VCreateTravelListCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
}
