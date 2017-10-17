import Foundation

extension URL
{
    //MARK: internal
    
    mutating func excludeFromBackup()
    {
        var resourceValues:URLResourceValues = URLResourceValues()
        resourceValues.isExcludedFromBackup = true
        
        do
        {
            try setResourceValues(resourceValues)
        }
        catch
        {
        }
    }
}
