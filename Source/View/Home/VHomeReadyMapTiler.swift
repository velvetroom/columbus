import MapKit

final class VHomeReadyMapTiler:MKTileOverlay
{
    init(plan:MHomePlan)
    {
        super.init(urlTemplate:plan.tileTemplate)
        
        canReplaceMapContent = true
        tileSize = CGSize(
            width:VHomeReadyMapTiler.Constants.tileSize,
            height:VHomeReadyMapTiler.Constants.tileSize)
    }
}
