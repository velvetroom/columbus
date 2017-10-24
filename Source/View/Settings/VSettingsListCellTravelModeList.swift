import UIKit

final class VSettingsListCellTravelModeList:
    VCollection<
    ArchSettings,
    VSettingsListCellTravelModeListCell>
{
    weak var model:MSettingsTravelMode?
    let kWaitToSelect:TimeInterval = 0.3
    private var cellSize:CGSize?
    
    required init(controller:CSettings)
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
        let item:MSettingsTravelModeProtocol = modelAtIndex(
            index:indexPath)
        let cell:VSettingsListCellTravelModeListCell = cellAtIndex(
            indexPath:indexPath)
        cell.config(model:item)
        
        return cell
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldSelectItemAt indexPath:IndexPath) -> Bool
    {
        let item:MSettingsTravelModeProtocol = modelAtIndex(
            index:indexPath)
        
        guard
        
            let model:MSettingsTravelMode = self.model,
            model.settings.travelMode != item.mode
        
        else
        {
            return false
        }
        
        return true
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        shouldHighlightItemAt indexPath:IndexPath) -> Bool
    {
        let item:MSettingsTravelModeProtocol = modelAtIndex(
            index:indexPath)
        
        guard
            
            let model:MSettingsTravelMode = self.model,
            model.settings.travelMode != item.mode
            
        else
        {
            return false
        }
        
        return true
    }
    
    override func collectionView(
        _ collectionView:UICollectionView,
        didSelectItemAt indexPath:IndexPath)
    {
        
    }
}
