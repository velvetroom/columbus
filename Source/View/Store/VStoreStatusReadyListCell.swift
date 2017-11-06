import UIKit

class VStoreStatusReadyListCell:UICollectionViewCell
{
    weak var imageView:UIImageView!
    weak var labelTitle:UILabel!
    private(set) weak var controller:CStore?
    let kImageHeight:CGFloat = 260
    let kTitleHeight:CGFloat = 90
    let kTitleFontSize:CGFloat = 18
    
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
        imageView.image = model.icon
        labelTitle.text = model.title
    }
}
