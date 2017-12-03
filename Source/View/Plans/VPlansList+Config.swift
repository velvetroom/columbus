import UIKit

extension VPlansList
{
    //MARK: internal
    
    func config()
    {
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        registerHeader(header:VPlansListHeader.self)
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumInteritemSpacing = ViewMain.Constants.interCellSpace
            flow.minimumLineSpacing = ViewMain.Constants.interCellSpace
            flow.sectionInset = UIEdgeInsets(
                top:ViewMain.Constants.barHeight,
                left:0,
                bottom:ViewMain.Constants.menuHeight,
                right:0)
        }
    }
}
