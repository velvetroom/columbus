import Foundation
import MapKit

extension DPlanTravel
{
    //MARK: internal
    
    func initialValues()
    {
        status = DPlanTravelStatus.unknown
        mode = DPlanTravelMode.unknown
    }
    
    public override func didTurnIntoFault()
    {
        guard
        
            let rawLocations:[CLLocation] = self.rawLocations,
            transientPolyline == nil
        
        else
        {
            return
        }
        
        let polyline:MKPolyline = MKPolyline(
            locations:rawLocations)
        transientPolyline = polyline
    }
    
    func cleanValues()
    {
        distance = 0
        duration = 0
        polyline = nil
    }
}
