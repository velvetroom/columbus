import UIKit

extension VHomeReadyBarList
{
    //MARK: internal
    
    func config()
    {
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VHomeReadyBarListHeader.self)
        
        if let flow:VCollectionFlow = self.collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.headerReferenceSize = CGSize(width:0, height:VHomeReadyBarList.Constants.headerHeight)
            flow.sectionInset = UIEdgeInsets(
                top:0,
                left:0,
                bottom:VHomeReadyBarList.Constants.collectionBottom,
                right:0)
        }
    }
}
