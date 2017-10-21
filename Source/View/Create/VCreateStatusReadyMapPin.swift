import MapKit

final class VCreateStatusReadyMapPin:MKAnnotationView
{
    private let centerImage:CGPoint
    private let centerImageDragging:CGPoint
    private let kImageOffsetY:CGFloat = -17
    private let kImageDragginOffsetY:CGFloat = 24
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(stop:DPlanStop)
    {
        let reuseIdentifier:String = VCreateStatusReadyMapPin.reusableIdentifier

        centerImage = CGPoint(
            x:0,
            y:kImageOffsetY)
        centerImageDragging = CGPoint(
            x:0,
            y:kImageDragginOffsetY)
        
        super.init(
            annotation:stop,
            reuseIdentifier:reuseIdentifier)
        
        isDraggable = true
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
        UIView.animate(withDuration:kAnimationDuration)
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
