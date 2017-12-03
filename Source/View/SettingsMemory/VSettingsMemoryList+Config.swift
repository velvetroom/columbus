import UIKit

extension VSettingsMemoryList
{
    //MARK: internal
    
    func config()
    {
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VSettingsMemoryListHeader.self)
        registerFooter(footer:VSettingsMemoryListFooter.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = VSettingsMemoryList.Constants.interItem
            flow.minimumInteritemSpacing = VSettingsMemoryList.Constants.interItem
            flow.headerReferenceSize = CGSize(
                width:0,
                height:VSettingsMemoryList.Constants.headerHeight)
            flow.footerReferenceSize = CGSize(
                width:0,
                height:VSettingsMemoryList.Constants.footerHeight)
            flow.sectionInset = UIEdgeInsets(
                top:VSettingsMemoryList.Constants.interItem,
                left:0,
                bottom:VSettingsMemoryList.Constants.interItem,
                right:0)
        }
    }
}
