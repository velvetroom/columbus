import UIKit

final class MCreateSave:Model<ArchCreateSave>
{
    static let kAppleToGoogleMaps:Double = 1048575
    static let kPaddingTile:Double = 1
    static let kTileSize:Double = 1024
    static let kTileScale:CGFloat = 1
    
    weak var database:Database?
    weak var plan:DPlan?
    weak var settings:DSettings?
}
