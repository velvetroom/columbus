import UIKit

final class MSettingsMemoryProject
{
    var project:DPlan?
    let identifier:String
    let size:CGFloat
    
    init(
        identifier:String,
        size:CGFloat)
    {
        self.identifier = identifier
        self.size = size
    }
}
