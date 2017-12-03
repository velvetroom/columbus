import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func updateLocation(stop:DPlanStop)
    {
        guard
            
            let indexPath:IndexPath = factoryIndexPath(stop:stop),
            let cell:VCreateStatusReadyBarStopsCell = collectionView.cellForItem(
                at:indexPath) as? VCreateStatusReadyBarStopsCell
            
        else
        {
            return
        }
        
        cell.config(
            controller:controller,
            model:stop)
    }
    
    func updateFooter()
    {
        let index:IndexPath = IndexPath(
            item:0,
            section:0)
        
        guard
        
            let footer:VCreateStatusReadyBarStopsFooter = collectionView.supplementaryView(
                forElementKind:UICollectionElementKindSectionFooter,
                at:index) as? VCreateStatusReadyBarStopsFooter,
            
            let travel:[DPlanTravel] = self.travel,
            let distanceSettings:DSettingsDistance = self.distanceSettings
        
        else
        {
            return
        }
        
        footer.config(
            model:travel,
            distanceSettings:distanceSettings)
    }
}
