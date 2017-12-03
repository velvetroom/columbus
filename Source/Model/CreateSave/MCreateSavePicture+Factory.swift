import Foundation

extension MCreateSavePicture
{
    //MARK: internal
    
    func factoryName() -> String
    {
        let x:String = String(self.x)
        let y:String = String(self.y)
        let z:String = String(self.z)
        
        var name:String = String()
        name.append(x)
        name.append(".")
        name.append(y)
        name.append(".")
        name.append(z)
        
        return name
    }
}
