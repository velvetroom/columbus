import UIKit

final class MHomeMapMenuContract:MHomeMapMenuProtocol
{
    let statusType:MHomeMapStatusProtocol.Type? = MHomeMapStatusContracted.self
    let icon:UIImage = #imageLiteral(resourceName: "assetMapButtonContract")
    let iconSelected:UIImage = #imageLiteral(resourceName: "assetMapButtonContractSelected")
}
