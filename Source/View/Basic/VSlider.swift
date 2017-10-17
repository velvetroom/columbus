import UIKit

final class VSlider:UIView
{
    var panInitialWidth:CGFloat?
    var percentUsed:CGFloat
    private(set) weak var viewBase:UIView!
    private(set) weak var viewBar:VSliderBar!
    private(set) weak var layoutBarWidth:NSLayoutConstraint!
    private(set) var sliderChange:((CGFloat) -> ())?
    private(set) var slidingFinished:(() -> ())?
    private let kHorizontalMargin:CGFloat = 20
    private let kCornerRadius:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    
    init(
        percentUsed:CGFloat = 0,
        sliderChange:((CGFloat) -> ())? = nil,
        slidingFinished:(() -> ())? = nil)
    {
        self.percentUsed = percentUsed
        
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.sliderChange = sliderChange
        self.slidingFinished = slidingFinished
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        layoutSlider()
    }
    
    //MARK: private
    
    private func factoryViews()
    {
        let viewBase:UIView = UIView()
        viewBase.clipsToBounds = true
        viewBase.backgroundColor = UIColor(white:0.95, alpha:1)
        viewBase.translatesAutoresizingMaskIntoConstraints = false
        viewBase.layer.cornerRadius = kCornerRadius
        viewBase.layer.borderWidth = kBorderWidth
        viewBase.layer.borderColor = UIColor(white:0, alpha:0.2).cgColor
        self.viewBase = viewBase
        
        let viewBar:VSliderBar = VSliderBar()
        self.viewBar = viewBar
        
        viewBase.addSubview(viewBar)
        addSubview(viewBase)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBase,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBase,
            toView:self,
            margin:kHorizontalMargin)
        
        NSLayoutConstraint.equalsVertical(
            view:viewBar,
            toView:viewBase)
        NSLayoutConstraint.leftToLeft(
            view:viewBar,
            toView:viewBase)
        layoutBarWidth = NSLayoutConstraint.width(
            view:viewBar)
        
        let gesture:UIPanGestureRecognizer = factoryGestureRecognizer()
        
        addGestureRecognizer(gesture)
    }
    
    private func layoutSlider()
    {
        let width:CGFloat = viewBase.bounds.maxX
        let percentWidth:CGFloat = percentUsed * width
        layoutBarWidth.constant = percentWidth
    }
    
    //MARK: internal
    
    func changeSlider(percentUsed:CGFloat)
    {
        self.percentUsed = percentUsed
        layoutSlider()
    }
}
