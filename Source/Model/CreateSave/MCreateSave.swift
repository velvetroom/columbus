import Foundation

final class MCreateSave:Model<ArchCreateSave>
{
    static let kPaddingTile:Double = 1
    static let kTileSize:Double = 256
    static let kTileScale:Double = 2
    static let kAppleToGoogleMaps:Double = 1048575
    
    weak var database:Database?
    weak var plan:DPlan?
    weak var settings:DSettings?
    weak var timer:Timer?
    let dispatchGroup:DispatchGroup
    
    required init()
    {
        dispatchGroup = MCreateSave.factoryDispatchGroup()
        
        super.init()
    }
    
    deinit
    {
        timer?.invalidate()
    }
}
