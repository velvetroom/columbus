import MapKit

final class VHomeReadyMap:VMap<ArchHome>
{
    private(set) weak var mapTiler:VHomeReadyMapTiler?
    
    override init(controller:CHome)
    {
        super.init(controller:controller)
        
        addTiler()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
//
//    override func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
//
//    }
    
    //MARK: private
    
    private func addTiler()
    {
        guard
            
            let plan:MHomePlan = controller.model.plan
        
        else
        {
            return
        }
        
        let mapTiler:VHomeReadyMapTiler = VHomeReadyMapTiler(plan:plan)
        self.mapTiler = mapTiler
        
        add(
            mapTiler,
            level:MKOverlayLevel.aboveLabels)
    }
}
