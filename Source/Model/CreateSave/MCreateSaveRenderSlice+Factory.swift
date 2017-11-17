import MapKit

extension MCreateSaveRenderSlice
{
    //MARK: private
    
    private static func factorySlices(
        tileRange:MCreateSaveTileRange,
        rects:[MCreateSaveRenderSliceRect]) -> [MCreateSaveRenderSlice]
    {
        var slices:[MCreateSaveRenderSlice] = []
        
        for rect:MCreateSaveRenderSliceRect in rects
        {
            let slice:MCreateSaveRenderSlice = factorySlice(
                tileRange:tileRange,
                rect:rect)
            
            slices.append(slice)
        }
        
        return slices
    }
    
    private static func factorySlice(
        tileRange:MCreateSaveTileRange,
        rect:MCreateSaveRenderSliceRect) -> MCreateSaveRenderSlice
    {
        let options:MKMapSnapshotOptions = factoryOptions(
            tileRange:tileRange,
            rect:rect)
        let slice:MCreateSaveRenderSlice = MCreateSaveRenderSlice(
            options:options,
            rect:rect)
        
        return slice
    }
    
    private static func factoryOptions(
        tileRange:MCreateSaveTileRange,
        rect:MCreateSaveRenderSliceRect) -> MKMapSnapshotOptions
    {
        let mapRect:MKMapRect = factoryMapRect(
            tileRange:tileRange,
            rect:rect)
        let size:CGSize = factoryOptionsSize(
            rect:rect)
        
        let options:MKMapSnapshotOptions = MKMapSnapshotOptions()
        options.mapRect = mapRect
        options.size = size
        options.scale = CGFloat(MCreateSave.Constants.Tile.scale)
        
        return options
    }
    
    private static func factoryMapRect(
        tileRange:MCreateSaveTileRange,
        rect:MCreateSaveRenderSliceRect) -> MKMapRect
    {
        let mapX:Double = rect.tileX * tileRange.tileMapSize
        let mapY:Double = rect.tileY * tileRange.tileMapSize
        let mapWidth:Double = rect.tileWidth * tileRange.tileMapSize
        let mapHeight:Double = rect.tileHeight * tileRange.tileMapSize
        
        let mapRect:MKMapRect = MKMapRectMake(
            mapX,
            mapY,
            mapWidth,
            mapHeight)
        
        return mapRect
    }
    
    private static func factoryOptionsSize(rect:MCreateSaveRenderSliceRect) -> CGSize
    {
        let width:Double = rect.tileWidth * MCreateSave.Constants.Tile.size
        let height:Double = rect.tileHeight * MCreateSave.Constants.Tile.size
        let size:CGSize = CGSize(
            width:width,
            height:height)
        
        return size
    }
    
    //MARK: internal
    
    static func factorySlices(tileRange:MCreateSaveTileRange) -> [MCreateSaveRenderSlice]
    {
        let rects:[MCreateSaveRenderSliceRect] = MCreateSaveRenderSliceRect.factoryRects(tileRange:tileRange)
        let slices:[MCreateSaveRenderSlice] = factorySlices(
            tileRange:tileRange,
            rects:rects)
        
        return slices
    }
}
