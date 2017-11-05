import Foundation

struct MStoreStatusLoading:MStoreStatusProtocol
{
    let viewType:View<ArchStore>.Type = VStoreStatusLoading.self
}
