import UIKit

extension UIFont
{
    static let kFontLight:String = "HelveticaNeue-Thin"
    static let kFontRegular:String = "HelveticaNeue"
    static let kFontMedium:String = "HelveticaNeue-Medium"
    static let kFontBold:String = "HelveticaNeue-Bold"
    
    class func light(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(name:kFontLight, size:size)!
        
        return font
    }
    
    class func regular(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(name:kFontRegular, size:size)!
        
        return font
    }
    
    class func medium(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(name:kFontMedium, size:size)!
        
        return font
    }
    
    class func bold(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(name:kFontBold, size:size)!
        
        return font
    }
}
