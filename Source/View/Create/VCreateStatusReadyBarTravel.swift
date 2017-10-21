import UIKit

final class VCreateStatusReadyBarTravel:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarTravelCell>
{
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        collectionView.isScrollEnabled = false
        collectionView.bounces = false
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
