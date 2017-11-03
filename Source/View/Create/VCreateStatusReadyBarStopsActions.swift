import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: private
    
    private func header(
        index:IndexPath) -> UICollectionReusableView
    {
        let reusable:VCreateStatusReadyBarStopsHeader = reusableAtIndex(
            kind:UICollectionElementKindSectionHeader,
            indexPath:index)
        
        return reusable
    }
    
    private func footer(
        index:IndexPath) -> UICollectionReusableView
    {
        let reusable:VCreateStatusReadyBarStopsFooter = reusableAtIndex(
            kind:UICollectionElementKindSectionFooter,
            indexPath:index)
        
        guard
            
            let travel:[DPlanTravel] = self.travel,
            let distanceSettings:DSettingsDistance = self.distanceSettings
        
        else
        {
            return reusable
        }
        
        reusable.config(
            model:travel,
            distanceSettings:distanceSettings)
        
        return reusable
    }
    
    //MARK: internal
    
    func modelAtIndex(
        index:IndexPath) -> DPlanStop
    {
        let item:DPlanStop = model![index.item]
        
        return item
    }
    
    func reusable(
        kind:String,
        index:IndexPath) -> UICollectionReusableView
    {
        let reusable:UICollectionReusableView
        
        if kind == UICollectionElementKindSectionHeader
        {
            reusable = header(index:index)
        }
        else
        {
            reusable = footer(index:index)
        }
        
        return reusable
    }
}
