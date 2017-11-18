import UIKit

extension VCreateSearchBaseList
{
    //MARK: internal
    
    func config()
    {
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = true
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kCollectionTop,
                left:0,
                bottom:kInterItem,
                right:0)
        }
    }
}
