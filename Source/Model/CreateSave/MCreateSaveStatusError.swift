import Foundation

struct MCreateSaveStatusError:MCreateSaveStatusProtocol
{
    let viewType:View<ArchCreateSave>.Type = VCreateSaveStatusError.self
}
