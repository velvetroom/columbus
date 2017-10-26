import UIKit

extension VCreateStatusReadyBarTravel
{
    //MARK: internal
    
    func config()
    {
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.sectionInset = UIEdgeInsets(
                top:kInsetsTop,
                left:0,
                bottom:0,
                right:0)
        }
    }
}
