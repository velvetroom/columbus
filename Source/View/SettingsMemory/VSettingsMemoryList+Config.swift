import UIKit

extension VSettingsMemoryList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VSettingsMemoryListHeader.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = VSettingsMemory.Constants.List.interItem
            flow.minimumInteritemSpacing = VSettingsMemory.Constants.List.interItem
            flow.headerReferenceSize = CGSize(
                width:0,
                height:VSettingsMemory.Constants.List.headerHeight)
            flow.sectionInset = UIEdgeInsets(
                top:0,
                left:0,
                bottom:VSettingsMemory.Constants.List.collectionBottom,
                right:0)
        }
    }
}
