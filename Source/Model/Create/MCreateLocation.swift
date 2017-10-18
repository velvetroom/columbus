import Foundation

extension MCreate
{
    //MARK: internal
    
    func checkAuthorization()
    {
        let locationStrategyType:MCreateLocationStrategyProtocol.Type = MCreate.factoryLocationStrategy()
        changeLocationStrategy(
            locationStrategyType:locationStrategyType)
    }
}
