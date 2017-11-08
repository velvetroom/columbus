import Foundation

extension String
{
    private static let kTableController:String = "LocalizableController"
    private static let kTableModel:String = "LocalizableModel"
    private static let kTableView:String = "LocalizableView"
    
    static func localizedController(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:kTableController,
            comment:String())
    }
    
    static func localizedModel(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:kTableModel,
            comment:String())
    }
    
    static func localizedView(key:String) -> String
    {
        return NSLocalizedString(
            key,
            tableName:kTableView,
            comment:String())
    }
}
