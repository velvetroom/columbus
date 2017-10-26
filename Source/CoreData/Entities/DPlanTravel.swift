import Foundation
import MapKit

extension DPlanTravel
{
    public override func awakeFromInsert()
    {
        status = DPlanTravelStatus.unknown
        mode = DPlanTravelMode.unknown
    }
    
    public override func awakeFromFetch()
    {
        super.awakeFromFetch()
        
        loadPolyline()
    }
    
    //MARK: private
    
    private func loadPolyline()
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
    
    //MARK: internal
    
    func cleanRoute()
    {
        distance = 0
        duration = 0
        polyline = nil
    }
}
