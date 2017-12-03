import UIKit

extension VStoreStatusReadyList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerCell(cell:VStoreStatusReadyListCellNew.self)
        registerCell(cell:VStoreStatusReadyListCellMessage.self)
        registerCell(cell:VStoreStatusReadyListCellUnavailable.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = ViewMain.Constants.interCellSpace
            flow.minimumInteritemSpacing = ViewMain.Constants.interCellSpace
            flow.sectionInset = UIEdgeInsets(
                top:ViewMain.Constants.barHeight,
                left:0,
                bottom:ViewMain.Constants.menuHeight,
                right:0)
        }
    }
}
