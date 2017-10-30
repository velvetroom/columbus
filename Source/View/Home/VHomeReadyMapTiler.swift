import MapKit

final class VHomeReadyMapTiler:MKTileOverlay
{
    init(plan:MHomePlan)
    {
        debugPrint("---- template \(plan.tileTemplate)")
        
        super.init(urlTemplate:plan.tileTemplate)
        canReplaceMapContent = true
    }
    
    override func loadTile(
        at path:MKTileOverlayPath,
        result:@escaping (Data?, Error?) -> Void)
    {
        debugPrint("path: \(path)")
        
        super.loadTile(at:path, result:result)
    }
}
