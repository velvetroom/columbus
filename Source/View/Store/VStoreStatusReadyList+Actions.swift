import UIKit

extension VStoreStatusReadyList
{
    //MARK: private
    
    private func factoryReusableIdentifier(item:MStorePerkProtocol) -> String
    {
        guard
        
            let status:MStorePerkStatusProtocol = item.status
        
        else
        {
            return VStoreStatusReadyListCellUnavailable.reusableIdentifier
        }
        
        return status.reusableIdentifier
    }
    
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MStorePerkProtocol
    {
        let item:MStorePerkProtocol = controller.model.perks[index.item]
        
        return item
    }
    
    func viewAtIndex(index:IndexPath) -> VStoreStatusReadyListCell
    {
        let item:MStorePerkProtocol = modelAtIndex(index:index)
        let reusableIdentifier:String = factoryReusableIdentifier(item:item)
        
        let cell:VStoreStatusReadyListCell = cellAtIndex(
            indexPath:index,
            reusableIdentifier:reusableIdentifier)
        
        cell.config(
            controller:controller,
            model:item)
        
        return cell
    }
}
