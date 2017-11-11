import XCTest
@testable import columbus

final class UTMCreateLocationStrategyDenied:XCTestCase
{
    //MARK: tests
    
    func testNextStep()
    {
        let model:MCreate = MCreate()
        
        XCTAssertNil(
            model.status,
            "status should be nil")
        
        model.changeLocationStrategy(
            locationStrategyType:MCreateLocationStrategyDenied.self)
        model.locationStrategy?.nextStep(model:model)
        
        let status:MCreateStatusDenied? = model.status as? MCreateStatusDenied
        
        XCTAssertNotNil(
            status,
            "status should be denied")
    }
}
