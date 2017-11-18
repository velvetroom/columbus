import Foundation

extension DPerk
{
    var type:DPerkType
    {
        get
        {
            guard
            
                let type:DPerkType = DPerkType(rawValue:rawType)
            
            else
            {
                return DPerkType.error
            }
            
            return type
        }
        
        set(newValue)
        {
            rawType = newValue.rawValue
        }
    }
}
