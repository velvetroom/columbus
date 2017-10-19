import Foundation

extension CCreate
{
    //MARK: private
    
    private func changeMapStatus(
        item:MCreateMapMenuProtocol)
    {
        guard
            
            let statusType:MCreateMapStatusProtocol.Type = item.statusType
        
        else
        {
            return
        }
        
        model.changeMapStatus(
            statusType:statusType)
    }
    
    //MARK: internal
    
    func menuItemSelected(
        item:MCreateMapMenuProtocol)
    {
        item.selected(controller:self)
        changeMapStatus(item:item)
    }
}
