import UIKit

final class VCreateSearchBase:View<ArchCreateSearch>
{
    weak var viewList:VCreateSearchBaseList!
    weak var viewBar:VCreateSearchBaseBar!
    weak var layoutTop:NSLayoutConstraint!
    let kHeight:CGFloat = 350
    let kBarHeight:CGFloat = 78
    let kBorderHeight:CGFloat = 1
    
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourBackgroundGray
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
