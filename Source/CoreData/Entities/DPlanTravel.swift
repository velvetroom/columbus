import Foundation

extension DPlanTravel
{
    //MARK: internal
    
    func initialValues()
    {
        status = DPlanTravelStatus.unknown
        mode = DPlanTravelMode.unknown
    }
    
    func cleanValues()
    {
        distance = 0
        duration = 0
        polyline = nil
    }
}
