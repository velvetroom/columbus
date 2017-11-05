import Foundation

struct MStoreStatusError:MStoreStatusProtocol
{
    let viewType:View<ArchStore>.Type = VStoreStatusError.self
    var error:String?
}
