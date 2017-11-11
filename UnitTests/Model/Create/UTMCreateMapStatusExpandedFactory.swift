import XCTest
@testable import columbus

final class UTMCreateMapStatusExpandedFactory:XCTestCase
{
    //MARK: tests
    
    func testFactoryMenuItems()
    {
        let items:[MCreateMapMenuProtocol] = MCreateMapStatusExpanded.factoryMenuItems()
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
        
        XCTAssertNotNil(
            itemContracted,
            "item contracted should be in factory")
        
        XCTAssertNil(
            itemExpand,
            "item expand should NOT be in factory")
    }
}
