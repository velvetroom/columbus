import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func updateLocation(stop:DPlanStop)
    {
        guard
            
            let indexPath:IndexPath = factoryIndexPath(
                stop:stop),
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
}
