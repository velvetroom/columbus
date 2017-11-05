import Foundation
import StoreKit

extension MStore
{
    //MARK: internal
    
    func transactionPurchasing(
        perk:MStorePerkProtocol,
        transaction:SKPaymentTransaction)
    {
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
}
