import MapKit

final class VHomeReadyMap:VMap<ArchHome>
{
    private(set) weak var mapTiler:VHomeReadyMapTiler!
    
    override init(controller:CHome)
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
        let mapTiler:VHomeReadyMapTiler = VHomeReadyMapTiler()
        self.mapTiler = mapTiler
        
        add(
            mapTiler,
            level:MKOverlayLevel.aboveLabels)
    }
}
