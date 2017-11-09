import XCTest
@testable import columbus

final class UTMCreateFactory:XCTestCase
{
    private let kWait:TimeInterval = 1
    
    //MARK: tests
    
    func testFactorySettings()
    {
        let fetchExpectation:XCTestExpectation = expectation(
            description:"fetch expectation")
        
        let model:MCreate = MCreate()
        model.factorySettings()
        
        waitForExpectations(timeout:kWait)
        { (error:Error?) in
            
            XCTAssertNotNil(
                model.database,
                "failed loading database")
            
            XCTAssertNotNil(
                model.settings,
                "failed loading settings")
        }
    }
}
