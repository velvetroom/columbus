import MapKit

final class VCreateStatusReadyMap:VMap<ArchCreate>
{
    private(set) weak var mapTiler:VCreateStatusReadyMapTiler!
    
    override init(controller:CCreate)
    {
        super.init(controller:controller)
        
        addTiler()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func addTiler()
    {
        let mapTiler:VCreateStatusReadyMapTiler = VCreateStatusReadyMapTiler()
        self.mapTiler = mapTiler
        
        add(
            mapTiler,
            level:MKOverlayLevel.aboveLabels)
    }
}
