import UIKit

final class MSettingsStorage:MSettingsProtocol
{
    let reusableIdentifier:String = VSettingsListCellStorage.reusableIdentifier
    let cellHeight:CGFloat = 100
    private(set) weak var settings:DSettings!
    private(set) weak var database:Database!
    
    init(
        settings:DSettings,
        database:Database)
    {
        self.settings = settings
        self.database = database
    }
}
