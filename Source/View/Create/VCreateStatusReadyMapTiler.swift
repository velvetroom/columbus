import MapKit

final class VCreateStatusReadyMapTiler:MKTileOverlay
{
    init()
    {
        super.init(urlTemplate:"{x}/{y}/{z}")
        canReplaceMapContent = false
    }
    
    override func loadTile(
        at path:MKTileOverlayPath,
        result:@escaping (Data?, Error?) -> Void)
    {
        print("path: \(path)")
        
        result(nil, nil)
    }
}
