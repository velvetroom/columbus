import XCTest
@testable import columbus

final class UTMCreateMapStatusContractedFactory:XCTestCase
{
    //MARK: tests
    
    func testFactoryMenuItems()
    {
        let items:[MCreateMapMenuProtocol] = MCreateMapStatusContracted.factoryMenuItems()
        var itemContracted:MCreateMapMenuContract?
        var itemExpand:MCreateMapMenuExpand?
        
        for item:MCreateMapMenuProtocol in items
        {
            if let contracted:MCreateMapMenuContract = item as? MCreateMapMenuContract
            {
                itemContracted = contracted
            }
            else if let expand:MCreateMapMenuExpand = item as? MCreateMapMenuExpand
            {
                itemExpand = expand
            }
        }
        
        XCTAssertNil(
            itemContracted,
            "item contracted should NOT be in factory")
        
        XCTAssertNotNil(
            itemExpand,
            "item expand should be in factory")
    }
}
