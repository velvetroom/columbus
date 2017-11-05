import UIKit

final class VCreateTravelList:VCollection<
    ArchCreateTravel,
    VCreateTravelListCell>
{
    private var cellSize:CGSize?
    
    required init(controller:CCreateTravel)
    {
        super.init(controller:controller)
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
}
