import UIKit

extension VHomeReadyBarList
{
    //MARK: internal
    
    func config()
    {
        collectionView.alwaysBounceVertical = true
        
        if let flow:VCollectionFlow = self.collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.sectionInset = UIEdgeInsets(
                top:VHomeReadyBar.Constants.headerHeight,
                left:0,
                bottom:VHomeReadyBarList.Constants.collectionBottom,
                right:0)
        }
    }
}
