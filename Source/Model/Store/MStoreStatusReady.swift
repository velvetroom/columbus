import Foundation

struct MStoreStatusReady:MStoreStatusProtocol
{
    let viewType:View<ArchStore>.Type = VStoreStatusReady.self
}
