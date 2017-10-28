import Foundation

final class MCreateSave:Model<ArchCreateSave>
{
    static let kTileSize:Double = 256
    
    weak var database:Database?
    weak var plan:DPlan?
    weak var settings:DSettings?
}
