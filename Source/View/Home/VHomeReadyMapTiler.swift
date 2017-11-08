import MapKit

final class VHomeReadyMapTiler:MKTileOverlay
{
    private let kTileSize:CGFloat = 512
    
    init(plan:MHomePlan)
    {
        super.init(urlTemplate:plan.tileTemplate)
        
        canReplaceMapContent = true
        tileSize = CGSize(
            width:kTileSize,
            height:kTileSize)
    }
}
