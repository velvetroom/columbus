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
            flow.minimumLineSpacing = ViewMain.Constants.interCellSpace
            flow.minimumInteritemSpacing = ViewMain.Constants.interCellSpace
            flow.headerReferenceSize = CGSize(
                width:0,
                height:VSettingsMemoryList.Constants.headerHeight)
            flow.sectionInset = UIEdgeInsets(
                top:ViewMain.Constants.interCellSpace,
                left:0,
                bottom:ViewMain.Constants.interCellSpace,
                right:0)
        }
    }
}
