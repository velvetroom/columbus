import UIKit

final class VHomeStandbyCell:UICollectionViewCell
{
    weak var icon:UIImageView!
    weak var labelInfo:UILabel!
    weak var layoutInfoHeight:NSLayoutConstraint!
    let attributesTitle:[NSAttributedStringKey:Any]
    let attributesDescr:[NSAttributedStringKey:Any]
    private let options:NSStringDrawingOptions
    
    override init(frame:CGRect)
    {
        options = NSStringDrawingOptions([
            NSStringDrawingOptions.usesFontLeading,
            NSStringDrawingOptions.usesLineFragmentOrigin])
        attributesTitle = VHomeStandbyCell.factoryAttributesTitle(
            fontSize:VHomeStandbyCell.Constants.titleFontSize)
        attributesDescr = VHomeStandbyCell.factoryAttributesDescr(
            fontSize:VHomeStandbyCell.Constants.descrFontSize)
        
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.white
        
        factoryViews()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func updateInfo(model:MHomeInfoProtocol)
    {
        let info:NSAttributedString = factoryInfo(model:model)
        
        labelInfo.attributedText = info
        updateInfoLayout(info:info)
    }
    
    private func updateInfoLayout(
        info:NSAttributedString)
    {
        layoutIfNeeded()
        
        let size:CGSize = CGSize(
            width:labelInfo.bounds.width,
            height:VHomeStandbyCell.Constants.infoMaxHeight)
        
        let boundingRect:CGRect = info.boundingRect(
            with:size,
            options:options,
            context:nil)
        
        let infoHeight:CGFloat = ceil(boundingRect.size.height)
        
        layoutInfoHeight.constant = infoHeight
    }
    
    //MARK: internal
    
    func config(model:MHomeInfoProtocol)
    {
        icon.image = model.icon
        
        updateInfo(model:model)
    }
}
