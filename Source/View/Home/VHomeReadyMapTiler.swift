import MapKit

final class VHomeReadyMapTiler:MKTileOverlay
{
    init(plan:MHomePlan)
    {
        debugPrint("---- template \(plan.tileTemplate)")
        
        super.init(urlTemplate:plan.tileTemplate)
        canReplaceMapContent = true
        minimumZ = 16
        maximumZ = 16
    }
    
    override func loadTile(
        at path:MKTileOverlayPath,
        result:@escaping (Data?, Error?) -> Void)
    {
        debugPrint("path: \(path)")
        
        let newPath:MKTileOverlayPath = MKTileOverlayPath(
            x:path.x,
            y:path.y,
            z:16,
            contentScaleFactor:path.contentScaleFactor)
        super.loadTile(at:newPath, result:result)
    }
}
