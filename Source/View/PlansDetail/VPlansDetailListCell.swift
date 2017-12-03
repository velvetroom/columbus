import UIKit

class VPlansDetailListCell:UICollectionViewCell
{
    weak var labelTitle:UILabel!
    weak var icon:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: internal
    
    func config(model:MPlansDetailItemProtocol)
    {
        labelTitle.text = model.title
    }
}
