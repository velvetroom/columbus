import Foundation
import CoreLocation

final class MCreatePlan
{
    var geocoder:CLGeocoder?
    let plan:DPlan
    private(set) weak var model:MCreate?
    
    init(
        model:MCreate,
        plan:DPlan)
    {
        self.model = model
        self.plan = plan
    }
    
    deinit
    {
        geocoder?.cancelGeocode()
    }
}
