import UIKit

extension VCreateStatusReadyBarTravel
{
    //MARK: internal
    
    func config()
    {
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        registerHeader(
            header:VCreateStatusReadyBarTravelHeader.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.headerReferenceSize = CGSize(
                width:0,
                height:kHeaderHeight)
        }
    }
}
