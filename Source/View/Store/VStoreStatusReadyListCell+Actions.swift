import UIKit

extension VStoreStatusReadyListCell
{
    //MARK: private
    
    private func factoryDescrHeight(descr:NSAttributedString) -> CGFloat
    {
        let width:CGFloat = bounds.width
        let marginHorizontal2:CGFloat = VStoreStatusReadyListCell.Constants.descrMarginHorizontal * 2.0
        let usableWidth:CGFloat = width - marginHorizontal2
        
        let size:CGSize = CGSize(
            width:usableWidth,
            height:VStoreStatusReadyListCell.Constants.descrMaxHeight)
        
        let rect:CGRect = descr.boundingRect(
            with:size,
            options:NSStringDrawingOptions([
                NSStringDrawingOptions.usesLineFragmentOrigin,
                NSStringDrawingOptions.usesFontLeading]),
            context:nil)
        
        let height:CGFloat = ceil(rect.size.height)
        
        return height
    }
    
    //MARK: internal
    
    func addDescr(model:MStorePerkProtocol)
    {
        let descr:NSAttributedString = NSAttributedString(
            string:model.descr,
            attributes:attributesDescr)
        
        let height:CGFloat = factoryDescrHeight(
            descr:descr)
        
        labelDescr.attributedText = descr
        layoutDescrHeight.constant = height
    }
}
