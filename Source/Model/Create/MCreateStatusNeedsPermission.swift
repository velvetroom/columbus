import Foundation

struct MCreateStatusNeedsPermision:MCreateStatusProtocol
{
    let viewType:View<ArchCreate>.Type = VCreateStatusNeedsPermission.self
}
