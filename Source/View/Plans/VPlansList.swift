import UIKit

final class VPlansList:VCollection<
    ArchPlans,
    VPlansListCell>
{
    let kInterItem:CGFloat = 1
    let kInsetsTop:CGFloat = 64
    let kInsetsBottom:CGFloat = 70
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 120
    
    required init(controller:CPlans)
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
        numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let count:Int = controller.model.plans?.count
        
        else
        {
            return 0
        }
        
        return count
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
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:DPlan = modelAtIndex(
            index:indexPath)
        let cell:VPlansListCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        return false
    }
}
