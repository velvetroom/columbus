import Foundation

extension CHome
{
    //MARK: private
    
    private func changeMapStatus(item:MHomeMapMenuProtocol)
    {
        guard
            
            let statusType:MHomeMapStatusProtocol.Type = item.statusType
            
        else
        {
            return
        }
        
        model.changeMapStatus(statusType:statusType)
    }
    
    //MARK: internal
    
    func menuItemSelected(item:MHomeMapMenuProtocol)
    {
        item.selected(controller:self)
        changeMapStatus(item:item)
    }
}
