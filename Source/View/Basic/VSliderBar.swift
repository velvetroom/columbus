import UIKit

final class VSliderBar:UIView
{
    private let kBorderWidth:CGFloat = 1
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let border:VBorder = VBorder(colour:UIColor(white:0, alpha:0.2))
        
        let blur:VBlur = VBlur.light()
        blur.alpha = 1
        
        let colorStart:UIColor = UIColor(white:1, alpha:0.1)
        let colorEnd:UIColor = UIColor.white
        
        let viewGradient:VGradient = VGradient.horizontal(
            colourLeft:colorStart,
            colourRight:colorEnd)
        
        addSubview(viewGradient)
        addSubview(blur)
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:border,
            toView:self)
        NSLayoutConstraint.width(
            view:border,
            constant:kBorderWidth)
        NSLayoutConstraint.rightToRight(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
