import Foundation

struct MCreateStatusError:MCreateStatusProtocol
{
    var message:String?
    let viewType:View<ArchCreate>.Type = VCreateStatusError.self
}
