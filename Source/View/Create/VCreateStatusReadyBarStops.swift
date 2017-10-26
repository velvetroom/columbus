import UIKit

final class VCreateStatusReadyBarStops:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarStopsCell>
{
    weak var viewTravel:VCreateStatusReadyBarTravel!
    let kInsetsTop:CGFloat = 10
    let kInsetsBottom:CGFloat = 6
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 50
    
    var model:[DPlanStop]?
    {
        get
        {
            return controller.model.plan?.plan.stops?.array as? [
                DPlanStop]
        }
    }
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func scrollViewDidScroll(
        _ scrollView:UIScrollView)
    {
        viewTravel.collectionView.contentOffset = scrollView.contentOffset
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
                height:kCellHeight)
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
        
            let count:Int = self.model?.count
        
        else
        {
            return 0
        }
        
        viewTravel.collectionView.reloadData()
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:DPlanStop = modelAtIndex(
            index:indexPath)
        let cell:VCreateStatusReadyBarStopsCell = cellAtIndex(
            indexPath:indexPath)
        
        cell.config(
            controller:controller,
            model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        selectedCell(indexPath:indexPath)
    }
}
