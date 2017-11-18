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
    }
}
