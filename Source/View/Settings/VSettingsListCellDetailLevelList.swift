import UIKit

final class VSettingsListCellDetailLevelList:
    VCollection<
    ArchSettings,
    VSettingsListCellDetailLevelListCell>
{
    weak var model:MSettingsDetailLevel?
    weak var viewSelector:VSettingsListCellDetailLevelListSelector!
    weak var layoutSelectorTop:NSLayoutConstraint!
    let selectorHeight_2:CGFloat
    let kSelectorMarginHorizontal:CGFloat = 20
    let kSelectorHeight:CGFloat = 30
    let kRailWidth:CGFloat = 4
    let kRailLeft:CGFloat = 68
    let kAnimationDuration:TimeInterval = 0.2
    let kWaitToSelect:TimeInterval = 0.1
    private var cellSize:CGSize?
    
    required init(controller:CSettings)
    {
        selectorHeight_2 = kSelectorHeight / 2.0
        
        super.init(controller:controller)
        config()
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
            let items:Int = collectionView.numberOfItems(inSection:0)
            let itemsFloat:CGFloat = CGFloat(items)
            let heightPerItem:CGFloat = height / itemsFloat
            let cellSize:CGSize = CGSize(
                width:width,
                height:heightPerItem)
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
            
            let count:Int = model?.items.count
            
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
        let item:MSettingsDetailLevelProtocol = modelAtIndex(
            index:indexPath)
        let cell:VSettingsListCellDetailLevelListCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        guard
            
            let model:MSettingsDetailLevel = self.model
            
        else
        {
            return false
        }
        
        let item:MSettingsDetailLevelProtocol = modelAtIndex(
            index:indexPath)
        
        guard
            
            model.settings.detailLevel == item.detailLevel
            
        else
        {
            return true
        }
        
        return false
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        model?.selected(index:indexPath.item)
        updateSelector()
    }
}
