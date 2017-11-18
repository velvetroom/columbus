import UIKit

extension VStoreStatusReadyList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerCell(
            cell:VStoreStatusReadyListCellNew.self)
        registerCell(
            cell:VStoreStatusReadyListCellDeferred.self)
        registerCell(
            cell:VStoreStatusReadyListCellPurchased.self)
        registerCell(
            cell:VStoreStatusReadyListCellPurchasing.self)
        registerCell(
            cell:VStoreStatusReadyListCellUnavailable.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kInsetsTop,
                left:0,
                bottom:kCollectionBottom,
                right:0)
        }
    }
}
