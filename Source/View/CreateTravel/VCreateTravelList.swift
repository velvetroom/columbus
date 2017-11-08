import UIKit

final class VCreateTravelList:VCollection<
    ArchCreateTravel,
    VCreateTravelListCell>
{
    weak var viewSelector:VCreateTravelListSelector!
    weak var layoutSelectorLeft:NSLayoutConstraint!
    weak var layoutSelectorTop:NSLayoutConstraint!
    let selectorSize_2:CGFloat
    let kSelectorSize:CGFloat = 50
    let kAnimationDuration:TimeInterval = 0.2
    let kWaitToSelect:TimeInterval = 0.1
    let kWaitToUpdate:TimeInterval = 0.4
    private var cellSize:CGSize?
    
    required init(controller:CCreateTravel)
    {
        selectorSize_2 = kSelectorSize / 2.0
        
        super.init(controller:controller)
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        factoryViews()
        selectCurrent()
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
            let height:CGFloat = collectionView.bounds.height
            let cellsInt:Int = collectionView.numberOfItems(
                inSection:0)
            let cells:CGFloat = CGFloat(cellsInt)
            let heightPerCell:CGFloat = height / cells
            let cellSize:CGSize = CGSize(
                width:width,
                height:heightPerCell)
            self.cellSize = cellSize
            
            return cellSize
        }
        
        return cellSize
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        numberOfItemsInSection section:Int) -> Int
    {
        let count:Int = controller.model.items.count
        
        return count
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
    {
        let item:MCreateTravelProtocol = modelAtIndex(
            index:indexPath)
        let cell:VCreateTravelListCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        let item:MCreateTravelProtocol = modelAtIndex(
            index:indexPath)
        controller.model.select(item:item)
        
        superview?.isUserInteractionEnabled = false
        updateSelector()
        waitAndClose()
    }
}
