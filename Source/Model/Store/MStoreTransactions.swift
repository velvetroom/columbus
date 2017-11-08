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
