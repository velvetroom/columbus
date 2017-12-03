import Foundation

struct MStoreStatusError:MStoreStatusProtocol
{
    var error:String?
    let viewType:View<ArchStore>.Type = VStoreStatusError.self
}
