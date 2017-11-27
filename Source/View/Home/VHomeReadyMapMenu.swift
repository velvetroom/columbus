import UIKit

final class VHomeReadyMapMenu:VCollection<
    ArchHome,
    VHomeReadyMapMenuCell>
{
    weak var layoutHeight:NSLayoutConstraint!
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
                height:VHomeReadyMapMenu.Constants.cellHeight)
            
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
            
            let count:Int = controller.model.mapStatus?.menuItems.count
            
        else
        {
            return 0
        }
        
        let cellsHeight:CGFloat = CGFloat(count) * VHomeReadyMapMenu.Constants.cellHeight
        layoutHeight.constant = cellsHeight
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomeMapMenuProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeReadyMapMenuCell = cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        super.collectionView(
            collectionView,
            didSelectItemAt:indexPath)
        
        let item:MHomeMapMenuProtocol = modelAtIndex(index:indexPath)
        controller.menuItemSelected(item:item)
    }
}
