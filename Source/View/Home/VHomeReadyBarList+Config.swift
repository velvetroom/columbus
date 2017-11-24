import UIKit

extension VHomeReadyBarList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VHomeReadyBarListHeader.self)
        
        if let flow:VCollectionFlow = self.collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumInteritemSpacing = VHomeReadyBarList.Constants.interItem
            flow.minimumLineSpacing = VHomeReadyBarList.Constants.interItem
            flow.headerReferenceSize = CGSize(width:0, height:VHomeReadyBarList.Constants.headerHeight)
            flow.sectionInset = UIEdgeInsets(
                top:VHomeReadyBarList.Constants.interItem,
                left:0,
                bottom:VHomeReadyBarList.Constants.interItem,
                right:0)
        }
    }
}
