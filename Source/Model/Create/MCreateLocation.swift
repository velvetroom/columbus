import Foundation

extension MCreate
{
    //MARK: internal
    
    func startLocation()
    {
        changeStatus(
            statusType:MCreateStatusNeedsPermision.self)
    }
}
