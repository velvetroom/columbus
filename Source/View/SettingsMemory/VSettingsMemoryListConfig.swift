import UIKit

extension VSettingsMemoryList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = kInterItem
            flow.minimumInteritemSpacing = kInterItem
            flow.headerReferenceSize = CGSize(
                width:0,
                height:kHeaderHeight)
            flow.sectionInset = UIEdgeInsets(
                top:0,
                left:0,
                bottom:kCollectionBottom,
                right:0)
        }
    }
}
