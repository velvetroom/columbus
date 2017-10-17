import UIKit

final class VMenu:UIView
{
    weak var collectionView:UICollectionView!
    private(set) weak var controller:ControllerParent!
    var cellSize:CGSize?
    let kDeselectTime:TimeInterval = 0.3
    private let kBorderHeight:CGFloat = 1
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(
            colour:UIColor.colourBackgroundDark.withAlphaComponent(0.2))
        
        addSubview(border)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        factoryCollection()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
