import UIKit

final class VSettingsList:VCollection<
    ArchSettings,
    VSettingsListCell>
{
    let kInterItem:CGFloat = 2
    let kInsetsTop:CGFloat = 64
    let kInsetsBottom:CGFloat = 70
    
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
        let item:MSettingsProtocol = modelAtIndex(
            index:indexPath)
        let width:CGFloat = collectionView.bounds.width
        let size:CGSize = CGSize(
            width:width,
            height:item.cellHeight)
        
        return size
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
        let item:MSettingsProtocol = modelAtIndex(
            index:indexPath)
        let cell:VSettingsListCell = cellAtIndex(
            reusableIdentifier:item.reusableIdentifier,
            indexPath:indexPath)
        
        cell.config(
            controller:controller,
            model:item)
        
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
