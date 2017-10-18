import Foundation

struct MCreateStatusDenied:MCreateStatusProtocol
{
    let viewType:View<ArchCreate>.Type = VCreateStatusDenied.self
}
