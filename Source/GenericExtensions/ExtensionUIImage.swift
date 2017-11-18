import UIKit

extension UIImage
{
    func imageCropping(rect:CGRect) -> UIImage?
    {
        guard
            
            let cgImage:CGImage = self.cgImage
            
        else
        {
            return nil
        }
        
        let width:CGFloat = CGFloat(cgImage.width)
        let height:CGFloat = CGFloat(cgImage.height)
        let posX:CGFloat = -rect.minX
        let posY:CGFloat = rect.maxY - height
        let drawingRect:CGRect = CGRect(
            x:posX,
            y:posY,
            width:width,
            height:height)
        
        UIGraphicsBeginImageContext(rect.size)
        
        guard
            
            let context:CGContext = UIGraphicsGetCurrentContext()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        context.translateBy(x:0, y:rect.height)
        context.scaleBy(x:1, y:-1)
        context.draw(cgImage, in:drawingRect)
        
        guard
            
            let newCgImage:CGImage = context.makeImage()
            
        else
        {
            UIGraphicsEndImageContext()
            
            return nil
        }
        
        UIGraphicsEndImageContext()
        
        let newImage:UIImage = UIImage(cgImage:newCgImage)
        
        return newImage
    }
}
