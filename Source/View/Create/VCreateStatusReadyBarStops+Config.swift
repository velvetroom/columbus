import UIKit

extension VCreateStatusReadyBarStops
{
    //MARK: internal
    
    func config()
    {
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VCreateStatusReadyBarStopsHeader.self)
        registerFooter(footer:VCreateStatusReadyBarStopsFooter.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.sectionInset = UIEdgeInsets(
                top:VCreateStatusReadyBarStops.Constants.insetsTop,
                left:0,
                bottom:0,
                right:0)
        }
    }
}
