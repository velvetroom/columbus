import MapKit

final class VCreateStatusReadyMapPin:MKAnnotationView
{
    private let kImageOffsetY:CGFloat = -22
    
    init(stop:DPlanStop)
    {
        let reuseIdentifier:String = VCreateStatusReadyMapPin.reusableIdentifier
        
        super.init(
            annotation:stop,
            reuseIdentifier:reuseIdentifier)
        
        isDraggable = true
        
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
    
    override func setDragState(
        _ newDragState:MKAnnotationViewDragState,
        animated:Bool)
    {
        let dragState:MKAnnotationViewDragState = VCreateStatusReadyMapPin.factoryDragState(
            state:newDragState)
        self.dragState = dragState
        
        hover()
    }
    
    //MARK: private
    
    private func hover()
    {
        if dragState == MKAnnotationViewDragState.dragging
        {
            image = #imageLiteral(resourceName: "assetMapAnnotationDragging")
        }
        else if isSelected || isHighlighted
        {
            image = #imageLiteral(resourceName: "assetMapAnnotationSelected")
        }
        else
        {
            image = #imageLiteral(resourceName: "assetMapAnnotation")
        }
    }
}
