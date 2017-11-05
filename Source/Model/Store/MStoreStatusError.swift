import Foundation

struct MStoreStatusError:MStoreStatusProtocol
{
    let viewType:View<ArchStore>.Type
    let error:String
}
