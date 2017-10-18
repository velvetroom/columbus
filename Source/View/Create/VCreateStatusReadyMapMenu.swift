import UIKit

final class VCreateStatusReadyMapMenu:VCollection<
    ArchCreate,
    VCreateStatusReadyMapMenuCell>
{
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
}
