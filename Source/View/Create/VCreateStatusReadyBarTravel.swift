import UIKit

final class VCreateStatusReadyBarTravel:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarTravelCell>
{
    private let kHeaderHeight:CGFloat = 45
    private var cellSize:CGSize?
    private let headerSize:CGSize
    private let kCellHeight:CGFloat = 50
    
    var model:[DPlanTravel]?
    {
        get
        {
            return controller.model.plan?.plan.travels?.array as? [
                DPlanTravel]
        }
    }
    
    required init(controller:CCreate)
    {
        headerSize = CGSize(
            width:0,
            height:kHeaderHeight)
        
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
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        guard
        
            let countStops:Int = controller.model.plan?.plan.stops?.count,
            countStops > 0
        
        else
        {
            return CGSize.zero
        }
        
        return headerSize
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
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let reusable:VCreateStatusReadyBarTravelHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return reusable
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:DPlanTravel = modelAtIndex(
            index:indexPath)
        let cell:VCreateStatusReadyBarTravelCell = cellAtIndex(
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
        super.collectionView(
            collectionView,
            didSelectItemAt:indexPath)
        
        let item:DPlanTravel = modelAtIndex(
            index:indexPath)
        controller.editTrave(travel:travel)
    }
}
