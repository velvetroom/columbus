import MapKit

final class VMapPin:MKAnnotationView
{
    private let centerImage:CGPoint
    private let centerImageDragging:CGPoint
    
    init(stop:DPlanStop)
    {
        let reuseIdentifier:String = VMapPin.reusableIdentifier
        
        centerImage = CGPoint(
            x:0,
            y:VMapPin.Constants.imageOffsetY)
        
        centerImageDragging = CGPoint(
            x:0,
            y:VMapPin.Constants.imageDragginOffsetY)
        
        super.init(
            annotation:stop,
            reuseIdentifier:reuseIdentifier)
        
        isDraggable = stop.draggable
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
        let dragState:MKAnnotationViewDragState = VMapPin.factoryDragState(state:newDragState)
        self.dragState = dragState
        
        guard
            
            animated
            
        else
        {
            return
        }
        
        animateHover()
    }
    
    //MARK: private
    
    private func animateHover()
    {
        UIView.animate(withDuration:VMapPin.Constants.animationDuration)
        { [weak self] in
            
            self?.hover()
        }
    }
    
    private func hover()
    {
        if dragState == MKAnnotationViewDragState.dragging
        {
            image = #imageLiteral(resourceName: "assetMapAnnotationDragging")
            centerOffset = centerImageDragging
        }
        else
        {
            if isSelected || isHighlighted
            {
                image = #imageLiteral(resourceName: "assetMapAnnotationSelected")
            }
            else
            {
                image = #imageLiteral(resourceName: "assetMapAnnotation")
            }
            
            centerOffset = centerImage
        }
    }
}
