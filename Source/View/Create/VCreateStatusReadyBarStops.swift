import UIKit

final class VCreateStatusReadyBarStops:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarStopsCell>
{
    weak var viewTravel:VCreateStatusReadyBarTravel!
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 50
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        collectionView.alwaysBounceVertical = true
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
        
            let count:Int = controller.model.plan?.plan.stops?.count
        
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
        let item:DPlanStop = modelAtIndex(
            index:indexPath)
        let cell:VCreateStatusReadyBarStopsCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> DPlanStop
    {
        let item:DPlanStop = controller.model.plan!.plan.stops![
            index.item] as! DPlanStop
        
        return item
    }
}
