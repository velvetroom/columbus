import UIKit

final class VGradient:UIView
{
    private static let kLocationStart:NSNumber = 0
    private static let kLocationEnd:NSNumber = 1
    
    class func diagonal(
        colourLeftBottom:UIColor,
        colourTopRight:UIColor) -> VGradient
    {
        let colours:[CGColor] = [
            colourLeftBottom.cgColor,
            colourTopRight.cgColor]
        let locations:[NSNumber] = [
            kLocationStart,
            kLocationEnd]
        let startPoint:CGPoint = CGPoint(x:0, y:1)
        let endPoint:CGPoint = CGPoint(x:1, y:0)
        
        let gradient:VGradient = VGradient(
            colours:colours,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    class func horizontal(
        colourLeft:UIColor,
        colourRight:UIColor) -> VGradient
    {
        let colours:[CGColor] = [
            colourLeft.cgColor,
            colourRight.cgColor]
        let locations:[NSNumber] = [
            kLocationStart,
            kLocationEnd]
        let startPoint:CGPoint = CGPoint(x:0, y:0.5)
        let endPoint:CGPoint = CGPoint(x:1, y:0.5)
        
        let gradient:VGradient = VGradient(
            colours:colours,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    class func vertical(
        colourTop:UIColor,
        colourBottom:UIColor) -> VGradient
    {
        let colours:[CGColor] = [
            colourTop.cgColor,
            colourBottom.cgColor]
        let locations:[NSNumber] = [
            kLocationStart,
            kLocationEnd]
        let startPoint:CGPoint = CGPoint(x:0.5, y:0)
        let endPoint:CGPoint = CGPoint(x:0.5, y:1)
        
        let gradient:VGradient = VGradient(
            colours:colours,
            locations:locations,
            startPoint:startPoint,
            endPoint:endPoint)
        
        return gradient
    }
    
    private init(
        colours:[CGColor],
        locations:[NSNumber],
        startPoint:CGPoint,
        endPoint:CGPoint)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        guard
            
            let gradientLayer:CAGradientLayer = self.layer as? CAGradientLayer
            
        else
        {
            return
        }
    
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = locations
        gradientLayer.colors = colours
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override open class var layerClass:AnyClass
    {
        get
        {
            return CAGradientLayer.self
        }
    }
}
