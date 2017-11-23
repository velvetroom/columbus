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
            flow.minimumLineSpacing = VCreateSearchBaseList.Constants.interItem
            flow.minimumInteritemSpacing = VCreateSearchBaseList.Constants.interItem
            flow.sectionInset = UIEdgeInsets(
                top:VCreateSearchBaseList.Constants.collectionTop,
                left:0,
                bottom:VCreateSearchBaseList.Constants.interItem,
                right:0)
        }
    }
}
