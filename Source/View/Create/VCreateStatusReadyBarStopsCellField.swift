import UIKit

final class VCreateStatusReadyBarStopsCellField:
    UIView
{
    private weak var label:UILabel!
    private let kCornerRadius:CGFloat = 4
    private let kFontSize:CGFloat = 12
    private let kLabelLeft:CGFloat = 12
    private let kLabelRight:CGFloat = -9
    
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
        label.font = UIFont.medium(size:kFontSize)
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
        label.textColor = UIColor.colourBackgroundDark
    }
    
    func notSelected()
    {
        backgroundColor = UIColor(white:1, alpha:0.1)
        label.textColor = UIColor.white
    }
}
