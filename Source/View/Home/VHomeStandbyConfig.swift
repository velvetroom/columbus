import UIKit

extension VHomeStandby
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        
        collectionView.alwaysBounceVertical = true
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.headerReferenceSize = CGSize(
                width:0,
                height:kHeaderHeight)
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
        }
    }
}
