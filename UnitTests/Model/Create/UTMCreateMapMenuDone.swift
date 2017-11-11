import XCTest
@testable import columbus

final class UTMCreateMapMenuDone:XCTestCase
{
    private var database:Database?
    private let kWait:TimeInterval = 1
    
    override func setUp()
    {
        super.setUp()
        
        let bundle:Bundle = Bundle(for:UTMCreateMapMenuDone.self)
        database = Database(bundle:bundle)
    }
    
    //MARK: private
    
    private func createPlan(
        completion:@escaping((DPlan) -> ()))
    {
        database?.create(completion:completion)
    }
    
    private func createStop(
        plan:DPlan,
        completion:@escaping(() -> ()))
    {
        database?.create
        { (stop:DPlanStop) in
            
            stop.plan = plan
            completion()
        }
    }
    
    //MARK: tests
    
    func testIsDoneableSuccess()
    {
        let createExpectation:XCTestExpectation = expectation(
            description:"create expectation")
        
        var modelPlan:DPlan?
        
        createPlan
        { [weak self] (plan:DPlan) in
            
            modelPlan = plan
            
            self?.createStop(
                plan:plan)
            {
                createExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWait)
        { (error:Error?) in
            
            XCTAssertNotNil(
                modelPlan,
                "failed creating plan")
            
            let model:MCreateMapMenuDone = MCreateMapMenuDone()
            let doneable:Bool = model.isDoneable(plan:modelPlan)
            
            XCTAssertTrue(
                doneable,
                "Project should be able to finish")
        }
    }
    
    func testIsDoneableFail()
    {
        let createExpectation:XCTestExpectation = expectation(
            description:"create expectation")
        
        var modelPlan:DPlan?
        
        createPlan
        { (plan:DPlan) in
            
            modelPlan = plan
            
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWait)
        { (error:Error?) in
            
            XCTAssertNotNil(
                modelPlan,
                "failed creating plan")
            
            let model:MCreateMapMenuDone = MCreateMapMenuDone()
            let doneable:Bool = model.isDoneable(plan:modelPlan)
            
            XCTAssertFalse(
                doneable,
                "Project should NOT be able to finish")
        }
    }
}
