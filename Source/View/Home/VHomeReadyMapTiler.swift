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
    
    override func loadTile(
        at path:MKTileOverlayPath,
        result:@escaping(Data?, Error?) -> Void)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadTile(tilePath:path, completion:result)
        }
    }
    
    //MARK: private
    
    private func asyncLoadTile(
        tilePath:MKTileOverlayPath,
        completion:(Data?, Error?) -> ())
    {
        let path:URL = url(forTilePath:tilePath)
        
        guard
            
            FileManager.default.fileExists(atPath:path.path)
            
        else
        {
            fallbackTile(completion:completion)
            
            return
        }
        
        loadTile(
            path:path,
            completion:completion)
    }
    
    private func loadTile(
        path:URL,
        completion:(Data?, Error?) -> ())
    {
        let data:Data
        
        do
        {
            try data = Data(contentsOf:path)
        }
        catch
        {
            completion(nil, nil)
            
            return
        }
        
        completion(data, nil)
    }
    
    private func fallbackTile(completion:(Data?, Error?) -> ())
    {
        guard
            
            let data:Data = UIImagePNGRepresentation(#imageLiteral(resourceName: "assetGenericTile"))
        
        else
        {
            completion(nil, nil)
            
            return
        }
        
        completion(data, nil)
    }
}
