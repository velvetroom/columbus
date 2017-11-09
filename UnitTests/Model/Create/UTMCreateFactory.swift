import XCTest
@testable import columbus

final class UTMCreateFactory:XCTestCase
{
    private let kWait:TimeInterval = 10
    
    //MARK: tests
    
    func testFactorySettings()
    {
        let fetchExpectation:XCTestExpectation = expectation(
            description:"fetch expectation")
        
        let bundle:Bundle = Bundle(for:UTMCreateFactory.self)
        let model:MCreate = MCreate()
        var database:Database?
        var settings:DSettings?
        
        model.factorySettings(bundle:bundle)
        { (inDatabase:Database, inSettings:DSettings) in
            
            print("----------- full fill")
            database = inDatabase
            settings = inSettings
            fetchExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWait)
        { (error:Error?) in
            
            XCTAssertNotNil(
                database,
                "failed loading database")
            
            XCTAssertNotNil(
                settings,
                "failed loading settings")
        }
    }
}
