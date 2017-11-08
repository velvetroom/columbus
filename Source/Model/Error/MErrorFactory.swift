import Foundation

extension MError
{
    //MARK: private
    
    private static func factory(key:String) -> MError
    {
        let message:String = String.localizedModel(
            key:key)
        let error:MError = MError(
            localizedDescription:message)
        
        return error
    }
    
    //MARK: internal
    
    static func factoryNoImageData() -> MError
    {
        let error:MError = factory(key:"MError_noImageData")
        
        return error
    }
}
