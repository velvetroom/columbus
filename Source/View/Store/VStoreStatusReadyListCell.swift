import UIKit

class VStoreStatusReadyListCell:UICollectionViewCell
{
    weak var imageView:UIImageView!
    weak var labelTitle:UILabel!
    weak var labelDescr:UILabel!
    weak var layoutDescrHeight:NSLayoutConstraint!
    private(set) weak var controller:CStore?
    let attributesDescr:[NSAttributedStringKey:Any]
    
    override init(frame:CGRect)
    {
        attributesDescr = VStoreStatusReadyListCell.factoryAttributesDescr(
            fontSize:kDescrFontSize)
        
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
        
        addDescr(model:model)
    }
}
