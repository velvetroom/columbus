import UIKit

final class VCreateStatusReadyMapMenu:VCollection<
    ArchCreate,
    VCreateStatusReadyMapMenuCell>
{
    weak var layoutHeight:NSLayoutConstraint!
    private var cellSize:CGSize?
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
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
                height:width)
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
        
        let width:CGFloat = collectionView.bounds.width
        let totalHeight:CGFloat = CGFloat(count) * width
        layoutHeight.constant = totalHeight
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateMapMenuProtocol = modelAtIndex(
            index:indexPath)
        let cell:VCreateStatusReadyMapMenuCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MCreateMapMenuProtocol
    {
        let item:MCreateMapMenuProtocol = controller.model.mapStatus!.menuItems[
            index.item]
        
        return item
    }
}
