import Foundation

final class MCreateSave:Model<ArchCreateSave>
{
    weak var database:Database?
    weak var plan:DPlan?
    weak var settings:DSettings?
    let kPaddingTile:Double = 1
    let kTileSize:Double = 256
}
