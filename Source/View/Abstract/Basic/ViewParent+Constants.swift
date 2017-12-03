import UIKit

extension ViewParent
{
    struct Constants
    {
        static let routerMap:[UIGestureRecognizerState:Router] = [
            UIGestureRecognizerState.began : gestureStateBegan,
            UIGestureRecognizerState.possible : gestureStateBegan,
            UIGestureRecognizerState.changed : gestureStateChanged,
            UIGestureRecognizerState.cancelled : gestureStateEnded,
            UIGestureRecognizerState.ended : gestureStateEnded,
            UIGestureRecognizerState.failed : gestureStateEnded]
        
        static let panningMaxX:CGFloat = 60
        static let panningMaxXDelta:CGFloat = 210
        static let panningMinXDelta:CGFloat = 30
    }
}
