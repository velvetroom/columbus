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
            flow.minimumLineSpacing = ViewMain.Constants.interCellSpace
            flow.minimumInteritemSpacing = ViewMain.Constants.interCellSpace
            flow.sectionInset = UIEdgeInsets(
                top:VHomeStandby.Constants.headerHeight + ViewMain.Constants.interCellSpace,
                left:0,
                bottom:ViewMain.Constants.menuHeight,
                right:0)
        }
    }
}
