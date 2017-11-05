import Foundation
import StoreKit

extension MStore
{
    
    
    //MARK: private
    
    private func updateTransaction(
        transaction:SKPaymentTransaction)
    {
        let identifier:String = transaction.payment.productIdentifier
        let transactionState:SKPaymentTransactionState = transaction.transactionState
        
        guard
            
            let perk:MStorePerkProtocol = perksMap[identifier],
            let transactionRouter:TransactionRouter = transactionMap[
                transactionState]
            
        else
        {
            return
        }
        
        transactionRouter(self)(perk, transaction)
        /*
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
        }*/
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
    
    func transactionPurchasing(
        perk:MStorePerkProtocol,
        transaction:SKPaymentTransaction)
    {
        
    }
}
