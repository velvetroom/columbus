import Foundation
import StoreKit

final class MStore:Model<ArchStore>
{
    typealias TransactionRouter = (
        (MStore) ->
        (MStorePerkProtocol,
        SKPaymentTransaction) -> ())
    
    var database:Database?
    var settings:DSettings?
    
    let transactionMap:[
        SKPaymentTransactionState:
        TransactionRouter]
    
    let perks:[MStorePerkProtocol]
    let perksMap:[String:MStorePerkProtocol]
    let modelKit:MStoreKit
    let priceFormatter:NumberFormatter
    private(set) var status:MStoreStatusProtocol?
    
    required init()
    {
        modelKit = MStoreKit()
        priceFormatter = MStore.factoryPriceFormatter()
        perks = MStore.factoryPerks()
        perksMap = MStore.factoryPerksMap(perks:perks)
        transactionMap = MStore.factoryTransactionMap()
        
        super.init()
        modelKit.model = self
    }
    
    //MARK: internal
    
    func changeStatus(statusType:MStoreStatusProtocol.Type)
    {
        let status:MStoreStatusProtocol = statusType.init()
        self.status = status
        
        view?.updateStatus()
    }
    
    func statusError(error:String)
    {
        let status:MStoreStatusError = MStoreStatusError(error:error)
        self.status = status
        
        view?.updateStatus()
    }
}
