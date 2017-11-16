import UIKit

final class VSettingsMemoryList:VCollection<
    ArchSettingsMemory,
    VSettingsMemoryListCell>
{
    let kInterItem:CGFloat = 1
    let kHeaderHeight:CGFloat = 124
    let kCollectionBottom:CGFloat = 10
    
    required init(controller:CSettingsMemory)
    {
        super.init(controller:controller)
        config()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
