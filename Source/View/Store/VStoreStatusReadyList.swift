import UIKit

final class VStoreStatusReadyList:VCollection<
    ArchStore,
    VStoreStatusReadyListCell>
{
    let kInterItem:CGFloat = 1
    let kInsetsTop:CGFloat = 64
    let kCollectionBottom:CGFloat = 50
    private var cellSize:CGSize?
    private let kCellHeight:CGFloat = 300
    
    required init(controller:CStore)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
