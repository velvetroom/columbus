import UIKit

final class VCreateStatusReadyBarStopsCellField:
    UIView
{
    private weak var label:UILabel!
    private let kCornerRadius:CGFloat = 4
    private let kFontSize:CGFloat = 13
    private let kLabelLeft:CGFloat = 6
    private let kLabelRight:CGFloat = -3
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        layer.cornerRadius = kCornerRadius
        
        let label:UILabel = UILabel()
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.clear
        label.font = UIFont.regular(size:kFontSize)
        label.numberOfLines = 1
        self.label = label
        
        addSubview(label)
        
        NSLayoutConstraint.equalsVertical(
            view:label,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:label,
            toView:self,
            constant:kLabelLeft)
        NSLayoutConstraint.rightToRight(
            view:label,
            toView:self,
            constant:kLabelRight)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(stop:DPlanStop)
    {
        label.text = stop.name
    }
    
    func selected()
    {
        backgroundColor = UIColor.white
    }
    
    func notSelected()
    {
        backgroundColor = UIColor(white:1, alpha:0.1)
    }
}
