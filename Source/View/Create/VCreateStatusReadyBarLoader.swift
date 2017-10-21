import UIKit

final class VCreateStatusReadyBarLoader:
    View<ArchCreate>
{
    private weak var viewProgress:UIView!
    private weak var layoutProgressWidth:NSLayoutConstraint!
    private let kAnimationDuration:TimeInterval = 10
    private let kFadeDuration:TimeInterval = 0.3
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        isUserInteractionEnabled = false
        
        let viewProgress:UIView = UIView()
        viewProgress.isUserInteractionEnabled = false
        viewProgress.translatesAutoresizingMaskIntoConstraints = false
        viewProgress.clipsToBounds = true
        viewProgress.backgroundColor = UIColor(white:1, alpha:0.3)
        viewProgress.alpha = 0
        self.viewProgress = viewProgress
        
        addSubview(viewProgress)
        
        NSLayoutConstraint.equalsVertical(
            view:viewProgress,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:viewProgress,
            toView:self)
        layoutProgressWidth = NSLayoutConstraint.width(
            view:viewProgress,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func animateProgress()
    {
        viewProgress.alpha = 1
        layoutProgressWidth.constant = bounds.width
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
        { [weak self] in
            
            self?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
            
            self?.animateFade()
        }
    }
    
    private func animateFade()
    {
        UIView.animate(withDuration:kFadeDuration)
        { [weak self] in
            
            self?.viewProgress.alpha = 0
        }
    }
    
    //MARK: internal
    
    func loadProgress()
    {
        layoutProgressWidth.constant = 0
        layoutIfNeeded()
        animateProgress()
    }
}
