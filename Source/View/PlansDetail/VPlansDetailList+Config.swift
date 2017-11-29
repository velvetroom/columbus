import UIKit

extension VPlansDetailList
{
    //MARK: internal
    
    func config()
    {
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VPlansDetailListHeader.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.headerReferenceSize = CGSize(width:0, height:VPlansDetailList.Constants.headerHeight)
            flow.sectionInset = UIEdgeInsets(
                top:0,
                left:0,
                bottom:VPlansDetailList.Constants.collectionBottom,
                right:0)
        }
    }
}
