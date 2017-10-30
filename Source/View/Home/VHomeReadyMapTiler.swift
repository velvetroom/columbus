import MapKit

final class VHomeReadyMapTiler:MKTileOverlay
{
    private let kTileSize:CGFloat = 512
    
    init(plan:MHomePlan)
    {
        debugPrint("---- template \(plan.tileTemplate)")
        
        super.init(urlTemplate:plan.tileTemplate)
        canReplaceMapContent = true
        minimumZ = 16
        maximumZ = 16
        tileSize = CGSize(
            width:kTileSize,
            height:kTileSize)
    }
    
    override func loadTile(
        at path:MKTileOverlayPath,
        result:@escaping (Data?, Error?) -> Void)
    {
        debugPrint("path: \(path)")
        
        super.loadTile(at:path, result:result)
    }
}
