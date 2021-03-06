import UIKit

final class VPlansList:VCollection<
    ArchPlans,
    VPlansListCell>
{
    private var cellSize:CGSize?
    
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
        referenceSizeForHeaderInSection section:Int) -> CGSize
    {
        let count:Int = collectionView.numberOfItems(inSection:section)
        
        guard
        
            count > 0
        
        else
        {
            let size:CGSize = CGSize(
                width:0,
                height:VPlansList.Constants.headerHeight)
            
            return size
        }
        
        return CGSize.zero
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
                height:VPlansList.Constants.cellHeight)
            
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        viewForSupplementaryElementOfKind kind:String,
        at indexPath:IndexPath) -> UICollectionReusableView
    {
        let header:VPlansListHeader = reusableAtIndex(
            kind:kind,
            indexPath:indexPath)
        
        return header
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:DPlan = modelAtIndex(index:indexPath)
        let active:Bool = modelIsActive(model:item)
        let cell:VPlansListCell = cellAtIndex(indexPath:indexPath)
        
        cell.config(
            controller:controller,
            model:item,
            active:active)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        let item:DPlan = modelAtIndex(index:indexPath)
        controller.showDetail(plan:item)
    }
}
