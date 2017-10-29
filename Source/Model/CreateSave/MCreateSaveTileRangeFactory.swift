import MapKit

extension MCreateSaveTileRange
{
    private static let kNameSeparator:String = "."
    
    //MARK: private
    
    private func factoryTiles() -> [MCreateSaveRenderTile]
    {
        var tiles:[MCreateSaveRenderTile] = []
        
        let minX:Int = Int(self.minX)
        let maxX:Int = Int(self.maxX)
        let minY:Int = Int(self.minY)
        let maxY:Int = Int(self.maxY)
        
        for indexX:Int in minX ... maxX
        {
            for indexY:Int in minY ... maxY
            {
                let tile:MCreateSaveRenderTile = factoryTile(
                    indexX:indexX,
                    indexY:indexY)
                
                tiles.append(tile)
            }
        }
        
        return tiles
    }
    
    private func factoryTile(
        indexX:Int,
        indexY:Int) -> MCreateSaveRenderTile
    {
        let name:String = factoryName(
            indexX:indexX,
            indexY:indexY)
        let options:MKMapSnapshotOptions = factoryOptions(
            indexX:indexX,
            indexY:indexY)
        
        let tile:MCreateSaveRenderTile = MCreateSaveRenderTile(
            x:indexY,
            y:indexY,
            name:name,
            options:options)
        
        return tile
    }
    
    private func factoryOptions(
        indexX:Int,
        indexY:Int) -> MKMapSnapshotOptions
    {
        let mapRect:MKMapRect = factoryMapRect(
            indexX:indexX,
            indexY:indexY)
        
        let options:MKMapSnapshotOptions = MKMapSnapshotOptions()
        options.mapRect = mapRect
        
        return options
    }
    
    private func factoryMapRect(
        indexX:Int,
        indexY:Int) -> MKMapRect
    {
        let mapX:Double = tileToMapPoint(
            tile:indexX)
        let mapY:Double = tileToMapPoint(
            tile:indexY)
        let mapRect:MKMapRect = MKMapRectMake(
            mapX,
            mapY,
            1 / tileSizeInMap * 1000000,
            1 / tileSizeInMap * 1000000)
        
        return mapRect
    }
    
    private func factoryName(
        indexX:Int,
        indexY:Int) -> String
    {
        let zoomInt:Int = Int(zoom)
        let stringX:String = String(indexX)
        let stringY:String = String(indexY)
        let stringZ:String = String(zoomInt)
        
        var string:String = String()
        string.append(stringX)
        string.append(MCreateSaveTileRange.kNameSeparator)
        string.append(stringY)
        string.append(MCreateSaveTileRange.kNameSeparator)
        string.append(stringZ)
        
        return string
    }
    
    private func tileToMapPoint(
        tile:Int) -> Double
    {
        let tileDouble:Double = Double(tile)
        let point:Double = tileDouble / tileSizeInMap
        
        return point
    }
    
    //MARK: internal
    
    func factoryRender() -> MCreateSaveRender
    {
        let tiles:[MCreateSaveRenderTile] = factoryTiles()
        
        let render:MCreateSaveRender = MCreateSaveRender(
            zoom:zoom,
            tiles:tiles)
        
        return render
    }
}
