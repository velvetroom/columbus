import Foundation

struct MHomeStatusReady:MHomeStatusProtocol
{
    let viewType:View<ArchHome>.Type = VHomeReady.self
}
