import Foundation

extension VPlansDetailList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> MPlansDetailItemProtocol
    {
        let item:MPlansDetailItemProtocol = controller.model.items[index.item]
        
        return item
    }
}
