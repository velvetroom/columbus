import Foundation

final class MCreateSaveRender
{
    let zoom:Double
    var slices:[MCreateSaveRenderSlice]
    
    init(zoom:Double, slices:[MCreateSaveRenderSlice])
    {
        self.zoom = zoom
        self.slices = slices
    }
}
