import Foundation

struct MCreateSaveStatusBusy:MCreateSaveStatusProtocol
{
    let viewType:View<ArchCreateSave>.Type = VCreateSaveStatusBusy.self
}
