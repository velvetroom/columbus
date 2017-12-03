import Foundation

struct MCreateStatusErrorDatabase:
    MCreateStatusProtocol,
    MCreateStatusErrorProtocol
{
    let viewType:View<ArchCreate>.Type = VCreateStatusError.self
    let message:String = String.localizedModel(key:"MCreateStatusErrorDatabase_message")
}
