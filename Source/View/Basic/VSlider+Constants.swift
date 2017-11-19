import UIKit

extension VSlider
{
    struct Constants
    {
        static let routerMap:[UIGestureRecognizerState:Router] = [
            UIGestureRecognizerState.began : gestureBegan,
            UIGestureRecognizerState.changed : gestureChanged,
            UIGestureRecognizerState.ended : gestureEnded,
            UIGestureRecognizerState.failed : gestureEnded,
            UIGestureRecognizerState.cancelled : gestureEnded]
        
        static let horizontalMargin:CGFloat = 20
        static let cornerRadius:CGFloat = 10
    }
}
