import Foundation

extension MCreateSaveZoomProtocol
{
    //MARK: private
    
    private static func zoomMap() -> [
        DSettingsDetailLevel:
        MCreateSaveZoomProtocol.Type]
    {
        let map:[DSettingsDetailLevel:MCreateSaveZoomProtocol.Type] = [
                DSettingsDetailLevel.min : MCreateSaveZoomMin.self,
                DSettingsDetailLevel.medium : MCreateSaveZoomMedium.self,
                DSettingsDetailLevel.max : MCreateSaveZoomMax.self]
        
        return map
    }
    
    //MARK: internal
    
    static func factoryZoom(detailLevel:DSettingsDetailLevel) -> MCreateSaveZoomProtocol
    {
        let map:[DSettingsDetailLevel:MCreateSaveZoomProtocol.Type] = zoomMap()
        
        guard
        
            let zoomType:MCreateSaveZoomProtocol.Type = map[detailLevel]
        
        else
        {
            let zoom:MCreateSaveZoomDefault = MCreateSaveZoomDefault()
            
            return zoom
        }
        
        let zoom:MCreateSaveZoomProtocol = zoomType.init()
        
        return zoom
    }
}
