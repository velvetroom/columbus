import UIKit

final class VCreateSaveStatusBusyProgress:View<ArchCreateSave>
{
    private weak var layoutBarWidth:NSLayoutConstraint!
    private var progress:CGFloat
    private let kBarAlpha:CGFloat = 0.3
    private let kBackgroundAlpha:CGFloat = 0.1
    
    required init(controller:CCreateSave)
    {
        progress = 0
        let backgroundColor:UIColor = UIColor(white:1, alpha:kBackgroundAlpha)
        let barColor:UIColor = UIColor(white:1, alpha:kBarAlpha)
        
        super.init(controller:controller)
        isUserInteractionEnabled = false
        self.backgroundColor = backgroundColor
        
        let viewBar:VBorder = VBorder(colour:barColor)
        
        addSubview(viewBar)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:self)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar,
            toView:self,
            multiplier:0)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let width:CGFloat = bounds.width
        let barWidth:CGFloat = width * progress
        layoutBarWidth.constant = barWidth
        
        super.layoutSubviews()
    }
    
    //MARK: internal
    
    func update(progress:Float)
    {
        self.progress = CGFloat(progress)
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.setNeedsLayout()
        }
    }
}
