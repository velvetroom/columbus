import Foundation

final class MStore:Model<ArchStore>
{
    var error:String?
    let modelKit:MStoreKit
    let priceFormatter:NumberFormatter
    
    required init()
    {
        modelKit = MStoreKit()
        priceFormatter = MStore.factoryPriceFormatter()
        
        super.init()
        modelKit.model = self
    }
}
