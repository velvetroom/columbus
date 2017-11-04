import UIKit

final class VPlansList:VCollection<
    ArchPlans,
    VPlansListCell>
{
    let kInterItem:CGFloat = 1
    let kInsetsTop:CGFloat = 64
    let kCollectionBottom:CGFloat = 50
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 95
    private let kHeaderHeight:CGFloat = 300
    
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
        let count:Int = collectionView.numberOfItems(
            inSection:section)
        
        guard
        
            count > 0
        
        else
        {
            let size:CGSize = CGSize(
                width:0,
                height:kHeaderHeight)
            
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
                height:kCellHeight)
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
        let item:DPlan = modelAtIndex(
            index:indexPath)
        let active:Bool = modelIsActive(
            model:item)
        
        let cell:VPlansListCell = cellAtIndex(
            indexPath:indexPath)
        
        cell.config(
            controller:controller,
            model:item,
            active:active)
        
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
