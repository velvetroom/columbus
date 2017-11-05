import Foundation
import StoreKit

extension MStore
{
    //MARK: private
    
    private func updateTransaction(
        transaction:SKPaymentTransaction)
    {
        let productId:String = skPaymentTransaction.payment.productIdentifier
        
        guard
            
            let mappedItem:MStoreItem = mapItems[productId]
            
            else
        {
            continue
        }
        
        switch skPaymentTransaction.transactionState
        {
        case SKPaymentTransactionState.deferred:
            
            mappedItem.statusDeferred()
            
            break
            
        case SKPaymentTransactionState.failed:
            
            mappedItem.statusNew()
            SKPaymentQueue.default().finishTransaction(skPaymentTransaction)
            
            break
            
        case SKPaymentTransactionState.purchased,
             SKPaymentTransactionState.restored:
            
            mappedItem.statusPurchased(callAction:true)
            SKPaymentQueue.default().finishTransaction(skPaymentTransaction)
            
            break
            
        case SKPaymentTransactionState.purchasing:
            
            mappedItem.statusPurchasing()
            
            break
        }
    }
    
    //MARK: internal
    
    func updateTransactions(
        transactions:[SKPaymentTransaction])
    {
        for transaction:SKPaymentTransaction in transactions
        {
            updateTransaction(transaction:transaction)
        }
        
        view?.refreshStore()
    }
}
