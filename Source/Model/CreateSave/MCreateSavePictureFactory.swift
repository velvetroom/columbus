import Foundation

extension MCreateSavePicture
{
    private static let kDot:String = "."
    
    //MARK: internal
    
    func factoryName() -> String
    {
        let x:String = String(self.x)
        let y:String = String(self.y)
        let z:String = String(self.z)
        
        var name:String = String()
        name.append(x)
        name.append(MCreateSavePicture.kDot)
        name.append(y)
        name.append(MCreateSavePicture.kDot)
        name.append(z)
        
        return name
    }
}
