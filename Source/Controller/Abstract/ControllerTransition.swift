import UIKit

enum ControllerTransition
{
    enum Vertical:CGFloat
    {
        case top = -1
        case bottom = 1
        case none = 0
    }
    
    enum Horizontal:CGFloat
    {
        case left = -1
        case right = 1
        case none = 0
    }
}
