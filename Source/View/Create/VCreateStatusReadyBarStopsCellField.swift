import UIKit

final class VCreateStatusReadyBarStopsCellField:
    UIView
{
    private let kCornerRadius:CGFloat = 6
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        layer.cornerRadius = kCornerRadius
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(stop:DPlanStop)
    {
        
    }
    
    func selected()
    {
        backgroundColor = UIColor.colourFail
    }
    
    func notSelected()
    {
        backgroundColor = UIColor(white:1, alpha:0.2)
    }
}
