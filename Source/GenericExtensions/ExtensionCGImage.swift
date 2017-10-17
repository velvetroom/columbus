import UIKit

extension CGImage
{
    func resize(
        canvasSize:CGSize,
        imageRect:CGRect) -> CGImage?
    {
        UIGraphicsBeginImageContext(canvasSize)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        context.translateBy(x:0, y:imageRect.height)
        context.scaleBy(x:1, y:-1)
        context.draw(self, in:imageRect)
        
        guard
            
            let newImage:CGImage = context.makeImage()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
