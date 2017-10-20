import Foundation

extension VCreateStatusReadyBar
{
    //MARK: internal
    
    func reload()
    {
        viewStops.collectionView.reloadData()
        viewTravel.collectionView.reloadData()
    }
}
