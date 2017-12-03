import Foundation

extension VCreateStatusReadyBar
{
    //MARK: internal
    
    func reload()
    {
        viewTravel.collectionView.reloadData()
        viewStops.collectionView.reloadData()
        viewStops.replicateScroll()
    }
}
