import MapKit

extension MCreateSaveTileRange
{
    //MARK: internal
    
    func factoryRender() -> MCreateSaveRender
    {
        let slices:[MCreateSaveRenderSlice] = MCreateSaveRenderSlice.factorySlices(
            tileRange:self)
        
        let render:MCreateSaveRender = MCreateSaveRender(
            zoom:zoom,
            slices:slices)
        
        return render
    }
}
