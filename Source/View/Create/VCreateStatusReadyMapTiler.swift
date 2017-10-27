import MapKit

final class VCreateStatusReadyMapTiler:MKTileOverlay
{
    init()
    {
        super.init(urlTemplate:"{x}/{y}/{z}")
        canReplaceMapContent = false
    }
}
