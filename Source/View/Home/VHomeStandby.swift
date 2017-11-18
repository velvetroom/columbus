import UIKit

final class VHomeStandby:VCollection<
    ArchHome,
    VHomeStandbyCell>
{
    weak var layoutHeaderHeight:NSLayoutConstraint!
    private var cellSize:CGSize?
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        config()
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func scrollViewDidScroll(_ scrollView:UIScrollView)
    {
        let offsetY:CGFloat = scrollView.contentOffset.y
        var headerHeight:CGFloat = VHomeStandby.Constants.headerHeight - offsetY
        
        if headerHeight < VHomeStandby.Constants.headerMinHeight
        {
            headerHeight = VHomeStandby.Constants.headerMinHeight
        }
        
        layoutHeaderHeight.constant = headerHeight
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
                height:VHomeStandby.Constants.cellHeight)
            
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.info.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MHomeInfoProtocol = modelAtIndex(index:indexPath)
        let cell:VHomeStandbyCell = cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
}
