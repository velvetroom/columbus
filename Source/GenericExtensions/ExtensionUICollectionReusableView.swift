import UIKit

extension UICollectionReusableView
{
    open class var reusableIdentifier:String
    {
        get
        {
            let stringName:String = String(describing:self)
            
            return stringName
        }
    }
}
