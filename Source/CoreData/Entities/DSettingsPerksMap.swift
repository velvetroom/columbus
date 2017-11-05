import Foundation

extension DSettings
{
    var perksMap:[DPerkType:DPerk]
    {
        get
        {
            var perksMap:[DPerkType:DPerk] = [:]
            
            guard
                
                let perks:[DPerk] = self.perks?.array as? [DPerk]
                
            else
            {
                return perksMap
            }
            
            for perk:DPerk in perks
            {
                perksMap[perk.type] = perk
            }
            
            return perksMap
        }
    }
}
