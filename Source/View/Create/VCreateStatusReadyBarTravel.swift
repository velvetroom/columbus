import UIKit

final class VCreateStatusReadyBarTravel:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarTravelCell>
{
    let kInsetsTop:CGFloat = 45
    private var cellSize:CGSize?
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
    }
}
