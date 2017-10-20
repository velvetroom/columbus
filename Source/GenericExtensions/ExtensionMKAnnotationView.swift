import MapKit

extension MKAnnotationView
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
