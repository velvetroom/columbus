import XCTest
@testable import columbus

final class UTMCreateLocationStrategyUnknown:XCTestCase
{
    //MARK: tests
    
    func testNextStep()
    {
        let model:MCreate = MCreate()
        
        XCTAssertNil(
            model.status,
            "status should be nil")
        
        model.changeLocationStrategy(
            locationStrategyType:MCreateLocationStrategyUnknown.self)
        model.locationStrategy?.nextStep(model:model)
        
        let status:MCreateStatusNeedsPermision? = model.status as? MCreateStatusNeedsPermision
        
        XCTAssertNotNil(
            status,
            "status should be needs permision")
    }
}
