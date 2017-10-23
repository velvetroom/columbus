import UIKit

final class VSettingsList:VCollection<
    ArchSettings,
    VSettingsListCell>
{
    private let kInterItem:CGFloat = 4
    private let kInsetsTop:CGFloat = 64
    private let kInsetsBottom:CGFloat = 70
    
    required init(controller:CSettings)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.colourBackgroundGray
        collectionView.alwaysBounceVertical = true
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumInteritemSpacing = kInterItem
            flow.minimumLineSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kInsetsTop,
                left:0,
                bottom:kInsetsBottom,
                right:0)
        }
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
