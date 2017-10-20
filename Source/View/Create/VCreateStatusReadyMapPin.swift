import MapKit

final class VCreateStatusReadyMapPin:MKAnnotationView
{
    private let kImageOffsetY:CGFloat = -20
    
    init(stop:DPlanStop)
    {
        let reuseIdentifier:String = VCreateStatusReadyMapPin.reusableIdentifier
        
        super.init(
            annotation:stop,
            reuseIdentifier:reuseIdentifier)
        
        centerOffset = CGPoint(
            x:0,
            y:kImageOffsetY)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override var annotation:MKAnnotation?
    {
        didSet
        {
            hover()
        }
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            image = #imageLiteral(resourceName: "assetMapAnnotationSelected")
        }
        else
        {
            image = #imageLiteral(resourceName: "assetMapAnnotation")
        }
    }
}
