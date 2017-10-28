import MapKit

extension MCreateSave
{
    //MARK: private
    
    private class func factoryRender(
        mapRange:MCreateSaveMapRange,
        zoom:MCreateSaveZoomProtocol) -> [MCreateSaveRender]
    {
        guard
        
            let firstZoom:Double = zoom.zoom.first
        
        else
        {
            return []
        }
        
        let render:MCreateSaveRender = tiles(
            mapRange:mapRange,
            zoom:firstZoom)
        
        let renders:[MCreateSaveRender] = [
            render]
        
        return render
    }
    
    //MARK: internal
    
    class func factorySnapshotRender(
        mapRange:MCreateSaveMapRange,
        settings:DSettings) -> [MCreateSaveRender]
    {
        let zoom:MCreateSaveZoomProtocol = MCreateSaveZoomDefault.factoryZoom(
            detailLevel:settings.detailLevel)
        
        let options:[MCreateSaveRender] = factoryRender(
            mapRange:mapRange,
            zoom:zoom)
        
        return options
    }
    
    class func factoryDirectory(
        plan:DPlan) -> URL
    {
        plan.objectID
    }
    
    class func directory() -> URL?
    {
        guard
            
            let directory:String = directoryName()
            
            else
        {
            return nil
        }
        
        let appDirectory:URL = FileManager.appDirectory
        let projects:URL = appDirectory.appendingPathComponent(
            directory)
        
        return projects
    }
    
    @discardableResult class func createDirectory() -> URL?
    {
        guard
            
            let gifPath:URL = directory()
            
            else
        {
            return nil
        }
        
        do
        {
            try FileManager.default.createDirectory(
                at:gifPath,
                withIntermediateDirectories:true,
                attributes:nil)
        }
        catch
        {
            return nil
        }
        
        let excludedPath:URL = URL.excludeFromBackup(
            original:gifPath)
        
        return excludedPath
    }
}
