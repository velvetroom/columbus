import UIKit

struct MCreateMapMenuContract:MCreateMapMenuProtocol
{
    let statusType:MCreateMapStatusProtocol.Type = MCreateMapStatusContracted.self
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButton")
}
