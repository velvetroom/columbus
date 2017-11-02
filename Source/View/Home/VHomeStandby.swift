import UIKit

final class VHomeStandby:VCollection<
    ArchHome,
    VHomeStandbyCell>
{
    weak var layoutHeaderHeight:NSLayoutConstraint!
    let kHeaderHeight:CGFloat = 200
    let kHeaderMinHeight:CGFloat = 20
    let kInterItem:CGFloat = 1
    
    required init(controller:CHome)
    {
        super.init(controller:controller)
        config()
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func scrollViewDidScroll(
        _ scrollView:UIScrollView)
    {
        let offsetY:CGFloat = scrollView.contentOffset.y
        var headerHeight:CGFloat = kHeaderHeight - offsetY
        
        if headerHeight < kHeaderMinHeight
        {
            headerHeight = kHeaderMinHeight
        }
        
        layoutHeaderHeight.constant = headerHeight
    }
}
