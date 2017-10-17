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
    
    func capitalizedFirstLetter() -> String
    {
        let count:Int = characters.count
        
        if count < 1
        {
            return self
        }
        else if count == 1
        {
            return uppercased()
        }
        
        let firstLetter:String = String(self[startIndex]).uppercased()
        let remainRange:Range = Range(uncheckedBounds:(
            lower:index(startIndex, offsetBy:1),
            upper:index(startIndex, offsetBy:count)))
        let remain:String = self[remainRange].lowercased()
        let newString:String = firstLetter.appending(remain)
        
        return newString
    }
}
