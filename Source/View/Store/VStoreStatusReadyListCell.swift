import UIKit

class VStoreStatusReadyListCell:UICollectionViewCell
{
    weak var imageView:UIImageView!
    private(set) weak var controller:CStore?
    let kImageHeight:CGFloat = 260
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        backgroundColor = UIColor.white
        clipsToBounds = true
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(
        controller:CStore,
        model:MStorePerkProtocol)
    {
        self.controller = controller
        self.imageView.image = model.icon
    }
}
