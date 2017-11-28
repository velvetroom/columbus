import Foundation

extension VPlansDetailList
{
    //MARK: internal
    
    func modelAtIndex(index:IndexPath) -> DPlanStop
    {
        let item:DPlanStop = model![index.item]
        
        return item
    }
}
