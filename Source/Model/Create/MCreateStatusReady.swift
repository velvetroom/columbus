import Foundation

struct MCreateStatusReady:MCreateStatusProtocol
{
    let viewType:View<ArchCreate>.Type = VCreateStatusReady.self
}
