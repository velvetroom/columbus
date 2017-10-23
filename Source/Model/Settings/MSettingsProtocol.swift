import UIKit

protocol MSettingsProtocol
{
    var reusableIdentifier:String { get }
    var cellHeight:CGFloat { get }
    
    init(settings:DSettings)
}
