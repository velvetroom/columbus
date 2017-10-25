import Foundation
import CoreLocation

final class MCreatePlan
{
    var geocoder:CLGeocoder?
    let database:Database
    let plan:DPlan
    private(set) weak var model:MCreate?
    
    init(
        model:MCreate,
        database:Database,
        plan:DPlan)
    {
        self.model = model
        self.database = database
        self.plan = plan
    }
    
    deinit
    {
        geocoder?.cancelGeocode()
    }
}
