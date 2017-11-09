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
        
        let bundle:Bundle = Bundle(for:UTMCreateFactory.self)
        var database:Database?
        var settings:DSettings?
        
        MCreate.factorySettings(bundle:bundle)
        { (inDatabase:Database, inSettings:DSettings) in
            
            database = inDatabase
            settings = inSettings
            fetchExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWait)
        { (error:Error?) in
            
            XCTAssertNil(
                database,
                "failed loading database")
            
            XCTAssertNotNil(
                settings,
                "failed loading settings")
        }
    }
}
