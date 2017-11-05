import Foundation

final class MStore:Model<ArchStore>
{
    var error:String?
    let perks:[MStorePerkProtocol]
    let perksMap:[String:MStorePerkProtocol]
    let modelKit:MStoreKit
    let priceFormatter:NumberFormatter
    
    required init()
    {
        modelKit = MStoreKit()
        priceFormatter = MStore.factoryPriceFormatter()
        perks = MStore.factoryPerks()
        perksMap = MStore.factoryPerksMap(
            perks:perks)
        
        super.init()
        modelKit.model = self
    }
}
