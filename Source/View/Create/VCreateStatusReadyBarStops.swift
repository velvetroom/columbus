import UIKit

final class VCreateStatusReadyBarStops:
    VCollection<
    ArchCreate,
    VCreateStatusReadyBarStopsCell>
{
    weak var viewTravel:VCreateStatusReadyBarTravel!
    private let kCellHeight:CGFloat = 60
    
    required init(controller:CCreate)
    {
        super.init(controller:controller)
        collectionView.alwaysBounceVertical = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
