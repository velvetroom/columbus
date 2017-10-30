import MapKit

final class VHomeReadyMapTiler:MKTileOverlay
{
    init()
    {
        super.init(urlTemplate:"{x}/{y}/{z}")
        canReplaceMapContent = false
    }
}
