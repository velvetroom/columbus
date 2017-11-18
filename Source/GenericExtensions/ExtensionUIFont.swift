import UIKit

extension UIFont
{
    class func light(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(
            name:UIFont.Constants.fontLight,
            size:size)!
        
        return font
    }
    
    class func regular(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(
            name:UIFont.Constants.fontRegular,
            size:size)!
        
        return font
    }
    
    class func medium(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(
            name:UIFont.Constants.fontMedium,
            size:size)!
        
        return font
    }
    
    class func bold(size:CGFloat) -> UIFont
    {
        let font:UIFont = UIFont(
            name:UIFont.Constants.fontBold,
            size:size)!
        
        return font
    }
}
