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
            flow.minimumLineSpacing = ViewMain.Constants.interCellSpace
            flow.minimumInteritemSpacing = ViewMain.Constants.interCellSpace
            flow.sectionInset = UIEdgeInsets(
                top:VCreateSearchBaseList.Constants.collectionTop,
                left:0,
                bottom:ViewMain.Constants.interCellSpace,
                right:0)
        }
    }
}
