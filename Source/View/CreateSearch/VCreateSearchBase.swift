import UIKit

final class VCreateSearchBase:View<ArchCreateSearch>
{
    weak var viewList:VCreateSearchBaseList!
    weak var layoutTop:NSLayoutConstraint!
    let kHeight:CGFloat = 400
    let kBorderHeight:CGFloat = 1
    
    required init(controller:CCreateSearch)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.white
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
