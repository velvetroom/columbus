import MapKit

final class VCreateStatusReadyMapPin:MKAnnotationView
{
    init(stop:DPlanStop)
    {
        let reuseIdentifier:String = VCreateStatusReadyMapPin.reusableIdentifier
        
        super.init(
            annotation:stop,
            reuseIdentifier:reuseIdentifier)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
