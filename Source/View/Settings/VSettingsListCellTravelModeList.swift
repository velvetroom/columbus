import UIKit

final class VSettingsListCellTravelModeList:VCollection<
    ArchSettings,
    VSettingsListCellTravelModeListCell>
{
    weak var model:MSettingsTravelMode?
    weak var viewSelector:VSettingsListCellTravelModeListSelector!
    weak var layoutSelectorLeft:NSLayoutConstraint!
    weak var layoutSelectorTop:NSLayoutConstraint!
    let selectorSize_2:CGFloat
    private var cellSize:CGSize?
    
    required init(controller:CSettings)
    {
        selectorSize_2 = VSettingsListCellTravelModeList.Constants.selectorSize / 2.0
        
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
            let widthPerItem:CGFloat = width / itemsFloat
            
            let cellSize:CGSize = CGSize(
                width:widthPerItem,
                height:height)
            
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
        let item:MSettingsTravelModeProtocol = modelAtIndex(index:indexPath)
        let cell:VSettingsListCellTravelModeListCell = cellAtIndex(indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        guard
            
            let model:MSettingsTravelMode = self.model
            
        else
        {
            return false
        }
        
        let item:MSettingsTravelModeProtocol = modelAtIndex(
            index:indexPath)
        
        guard
            
            model.settings.travelMode == item.mode
            
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
        updateSelector(animationDuration:VSettingsListCellTravelModeList.Constants.animationDuration)
    }
}
