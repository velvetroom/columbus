import XCTest
@testable import columbus

final class UTMCreateLocationStrategyReady:XCTestCase
{
    //MARK: tests
    
    func testDatabaseError()
    {
        let model:MCreate = MCreate()
        model.changeLocationStrategy(
            locationStrategyType:MCreateLocationStrategyReady.self)
        model.locationStrategy?.nextStep(model:model)
        
        let status:MCreateStatusErrorDatabase? = model.status as? MCreateStatusErrorDatabase
        
        XCTAssertNotNil(
            status,
            "status should be error database")
    }
}
