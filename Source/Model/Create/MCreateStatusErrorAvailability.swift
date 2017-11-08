import Foundation

struct MCreateStatusErrorAvailability:
    MCreateStatusProtocol,
    MCreateStatusErrorProtocol
{
    let viewType:View<ArchCreate>.Type = VCreateStatusError.self
    let message:String = String.localizedModel(
        key:"MCreateStatusErrorAvailability_message")
}
